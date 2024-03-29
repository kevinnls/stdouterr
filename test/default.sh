#!/usr/bin/env bash

set -e

# set -x for debugging if DEBUG is set
function debug() { set -xv; }
function get_last_commit() { git show -q --pretty='%h'; }
${DEBUG+debug}

# declare project info variables
declare -l project_lang project_name project_version;

project_name='stdouterr'
project_version='v0.1.0-beta'
project_lang='C'

curr_hash=$(get_last_commit)

script_dir="$(realpath -e $(dirname "${0}") 2>/dev/null)"
project_root=${script_dir%/*} # remove everything after the final `/`

test_dir="${project_root}/test"
out_dir="${test_dir}/output"
[[ ! -d "${out_dir}" ]] && mkdir -p "${out_dir}"
src_dir="${project_root}/src"

c_compilers=('gcc' 'clang')
cpp_compilers=('g++' 'clang')

       # create a unique name using date in nano-seconds --- bc lolz
_oname="${project_name:0:5}-${project_version}~${curr_hash}_$(date +%N)"
oname="$out_dir/${output:-${_oname}}"
_iname="${src_dir}/main.c"
iname="${input:-${_iname}}"

_compileargs=( )


# add args from env or set args based on env
# script version of -o retained unless overridden by env
if [[ -n "${compile_args}" ]]; then
    if [[ ! "${compile_args}" =~ /*-o/ ]]; then
	compile_args+=( -o "${oname}" )
    fi
else
    compile_args=( "${_compileargs[@]}" -o "${oname}" )
fi

compile_args+=( "${compile_aargs[@]}" )


case "${project_lang}" in
    'c')
       	compilers=( "${c_compilers[@]}" )
	;;
    'cpp')
	compilers=( "${cpp_compilers[@]}" )
	;;
    *)
	err_unknown_lang
	;;
esac

list_compilers(){
    for compiler in "${compilers[@]}"; do
	echo -e " - ${compiler}\\n"
    done
}

err_no_compilers(){
    1>&2 echo "ERR: no supported compiler found for ${project_lang}"
    1>&2 echo "install one of:"
    1>&2 list_compilers
    exit 127
}

check_compilers(){
    for compiler in "${compilers[@]}"; do
	compiler_path=$(command -v "${compiler}" 2>/dev/null)
	if [[ -n "${compiler_path}" ]]; then
	    echo "found compiler: ${compiler}"
	    compile(){
		echo "=== compiling ==="
		"${compiler_path}" "${compile_args[@]}" "${iname}"
		if [[ $? -eq 0 ]]; then
		    echo "=== compiled! ==="
		    return 0
		else
		    echo "=== compile failed! ==="
		    return 1
		fi
	    }
	break
	else
	    continue
	fi
    done
    { command -v compile ; } &>/dev/null \
	|| err_no_compilers
}

test(){
    echo "=== start of test ==="
    echo
    "${oname}" "$@"
    ret=$?
    echo
    echo
    echo "=== end of test ==="
    return ${ret}
}

if check_compilers; then
    if compile; then
	if test "$@"; then
	    echo "completed with exit code $?"
	    ln -sfn "${oname}" "${test_dir}/stdouterr"
	fi
    fi
else
    >>2 echo "some error occurred"
    exit 1
fi

