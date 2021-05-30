#! /usr/bin/bash
clear

if false
then
# Above line is called a SHEBANG followed by the name of the interpreter to use.
echo // ================================================================================ //
echo     Read Input Example
echo // ================================================================================ //
echo -n "Enter a anything: "
# read NAME
echo "Anything is: " $NAME

echo // ================================================================================ //
echo     Execute command & save output in variable
echo // ================================================================================ //
PWD=$(pwd)
BASH_VERSION=`bash --version`
echo $PWD
echo $BASH_VERSION

echo // ================================================================================ //
echo     Multiple commands on 1 line
echo // ================================================================================ //
echo $PWD; echo $BASH_VERSION

echo // ================================================================================ //
echo     String Interpolation
echo // ================================================================================ //
FIRST_NAME='John'
LAST_NAME='Doe'
echo $FIRST_NAME $LAST_NAME
FULL_NAME=$FIRST_NAME" "$LAST_NAME
echo $FULL_NAME

echo // ================================================================================ //
echo     String Concatenation
echo // ================================================================================ //
# Note: Spaces for formatting will produce Errors. So NUMBER = 1 <== ERROR !
NUMBER=1
NUMBER+=2         # 1+2 => 12
NUMBER+=$NUMBER   # 12+12 => 1212
echo $NUMBER

echo // ================================================================================ //
echo     String Variable Substituion
echo // ================================================================================ //
FIRST_NAME='JOHN'
LAST_NAME='DOE'
# result: "JOHN DOE"
FULL_NAME="$FIRST_NAME ${LAST_NAME}"
# ${VAR} expression outside a string
echo Hello ${FULL_NAME}!

echo // ================================================================================ //
echo     Single & Double Quotes
echo // ================================================================================ //
echo "I am 'John' and I am \"AWESOME\"."
echo '"Sorry" for that'
# Note: Single Quotes do not support interpolation
echo "Interpolated to ${FULL_NAME}"
echo 'Not Interpolated so ${FULL_NAME}'

NAME="John Doe Jr"
args $NAME

MESSAGE="I am a rock *"
echo $MESSAGE
echo "$MESSAGE"

echo // ================================================================================ //
echo     Halt program
echo // ================================================================================ //
echo "I am 'John' and I am '\"AWESOME\"."
exit # exit program
echo '"Sorry" for that'

echo // ================================================================================ //
echo     Arithmetic Operations
echo // ================================================================================ //
let RESULT=1+1
echo $RESULT
# safer way to write the above
let RESULT="1 + 1"
echo $RESULT

NUMBER=1
let RESULT="++NUMBER"
echo $RESULT
echo $NUMBER

let "RESULT = 5 * 5"  # 5 * 5 => 25
let "RESULT++"        # 25 + 1 => 26
echo $RESULT

NUM=5 #5
let NUM-=2       # 5 - 2 => 3
let NUM*=2       # 3 * 2 => 6
let NUM/=3       # 6 / 3 => 2
let NUM+=1       # 2 + 1 => 3
let NUM%=2       # 3 % 2 => 1
echo $NUM
echo // ================================================================================ //
echo     Expression Command expr
echo // ================================================================================ //
expr 1 + 1   # prints to the STDOUT
RESULT=$(expr 3 \* 3)
echo $RESULT

expr "1 + 1"
expr "1 + 1" + 1
expr "11" + 1

# the $((expression)) command syntax
RESULT=$((1 + 1))
echo $RESULT
RESULT=$(("1 + 1"))
echo $RESULT

# drop the $ to only evaluate and return result
NUM=5 # 5
((NUM -= 2)) # 5 - 2 => 3
(( NUM *= 2 )) # 3 * 2 => 6
(( NUM/=3 )) # 6 / 3 => 2  #=> easy to understand with spaces
((NUM += 1)) # 2 + 1 => 3
(( NUM%=2)) # 3 % 2 => 1
echo     ouvre Maamu Jee Ka $NUM

((NUM=5))
(( NUM += NUM )) # 5 + 5 => 10
(( NUM++ )) # 6++ => 11
(( NUM = $NUM - 3)) # 11 - 3 => 8
echo $NUM # <= Should be 8

echo // ================================================================================ //
echo     Test command & Last command status
echo // ================================================================================ //
test 5 -gt 9
echo $?

# test alternative [ "'[' is actually a bash command ! > which [ gives a result 😂🤣"
[ 2 -gt 1 ]
echo $?

[ 5 -gt 3 ] && [ 6 -lt 5 ]
echo "Result 1: $?"
([ 5 -gt 3 ] && [ 6 -lt 5 ]) || ([ 3 -gt 1 ] && [ 6 -gt 5 ])
echo "Result 2: $?"

echo // ================================================================================ //
echo     If Else Blocks
echo // ================================================================================ //
if [ true ]
then
  echo True
else
  echo False
fi

MY_VALUE=3;
echo -n "Enter a number: "; read USER_VALUE;
if [ "$USER_VALUE" -gt "$MY_VALUE" ]; then
    echo "You are great."
else
    echo "You are not so great."
fi

# if only block
PROCEED=YES
if [ "$PROCEED" = "YES" ]
then
    echo "Performing task..."
fi

# Operator, Purpose, For DataType
# =, Equal to operation, string
# ==, Equal to operation, string
# !=, is not equal to, string
# <, is less than in ASCII alphabetical order, string
# >, is greater than in ASCII alphabetical order, string
# -z, if a string is empty (or null), string
# -n, if a string is not empty (or not null), string
# -eq, is equal to, number
# -ne, is not equal to, number
# -lt, is less than, number
# -le, is less than or equal to, number
# -gt, is greater than, number
# -ge, is greater than or equal to, number

# string comparison
if [ 'proceed' == "proceed" ]; then echo "Performing task..."; fi
if [ 'Hello' != "hello" ]; then echo "Hello is not hello"; fi
if [ 'A' \< "a" ]; then echo "A is lower than a"; fi
if [ 'b' \> "a" ]; then echo "b is greater than a"; fi
if [ -z '' ]; then echo "String is empty"; fi
if [ -n 'something' ]; then echo "String is not empty"; fi

# numeric comparison
if [ 1 -eq 1 ]; then echo "1 is equal to 1"; fi
if [ 2 -ne 1 ]; then echo "1 is not equal to 2"; fi
if [ 0 -lt 1 ]; then echo "0 is less than 1"; fi
if [ 1 -gt 2 ]; then echo "1 is greater than to 2"; fi
if [ 1 -le 1 ]; then echo "1 is less than equal to 1"; fi
if [ 3 -ge 2 ]; then echo "3 is greater than equal to 2"; fi

# File Comparison Operator Reference 
# https://blog.100tb.com/scripting-if-comparison-operators-in-bash

# If ElseIf Blocks
VALUE=-10
if [ "$VALUE" -lt 0 ]; then
    echo "VALUE is less than 0"
elif [ "$VALUE" -eq 0 ]; then
    echo "VALUE is 0"
else
    echo "VALUE is greater than 0"
fi

# Nested if Else

VALUE=10
if [ "$VALUE" -lt 0 ]; then
    echo "VALUE is less than 0"
else
    echo "VALUE is greater than 0"
    if [ "$VALUE" -le 10 ]; then
        echo "VALUE is less than or equal to 10"
    else
        echo "VALUE is greater than 10"
    fi # end of nested if block
fi # end of parent if block

echo // ================================================================================ //
echo 	Utility Bash Functions & Variables
echo // ================================================================================ //

# The $RANDOM variable
echo $RANDOM $RANDOM $RANDOM $RANDOM
# random number between 0 - 10
echo $(($RANDOM % 11))

# Sequence (list) generation
echo {0..10} # step: 1
echo $(seq 0 10) # step: 1
echo $(seq 0 2 10) # step: 2
echo $(seq 10 -2 4) # step: -2

echo // ================================================================================ //
echo     "For; For in; For (()); While; Until; Loops"
echo // ================================================================================ //

for WORD in Hello "World" *.json "Nice" "to" "meet" "you."; do
    echo "${WORD}"
    echo $WORD
done

# Pick up variables from the command line. Don't use the "in" keyword
for clargs; do 
	echo $clargs
done

# echo $PATH 
alias ll='ls -alFth'
# Handling files. 'll' not working below.. Interesting...
# for FILE in `ll *.$2`
for FILE in `ls *.json`
do
    echo "Doing something with: $FILE"
done

# Traditional For Loop
for (( i = 0; i < 5; i++ )); do
    echo "The number is: $i"
done

for (( n = 0, i = 1; n < 5; n++, i += i )); do
    echo -n "$i, "
done

COUNTER=0
for ((;;))
do
    if [ $COUNTER -eq 5 ]; then
        exit
    else
        echo "Current number is: $(( COUNTER++ ))"
    fi
done

# While Loop
NUMBER=1
while [ $NUMBER -lt 5 ]; do
    echo "Number is: $((NUMBER++))"
done

NUMBER=1
while :                             # same as: while true
do
    echo "Number is: $((NUMBER++))"
    if [ $NUMBER == 4 ]; then
        exit
    fi
done

# Until Loop
NUMBER=1
until [ $NUMBER == 4 ]
do
    echo "Number is: $((NUMBER++))"
done

echo // ================================================================================ //
echo    Glob Pattern Matching
echo // ================================================================================ //
# Glob Patterns
# Pattern,	Description,	Example Pattern, Matches
# xyz, Match exactly xyz and nothing more, photo.db, photo.db 
# *,	Match any 0 or more characters,	*s.db, photos.db users.db ... (files with s.db suffix)
# ?,	Matches any single character,	?ing.db,	king.db ping.db ring.db
# [...],	Matches one character listed inside the brackets, [pr]ing.txt,	ping.txt ring.txt
# [start-end],	Matches any character from the start till the end of a set. Supported patterns are a-z; A-Z and 0-9, [m-z]ing.*, ping.db ping.txt ring.db ring.txt
# [!...], Matches one character not included in the brackets, [!pr]ing.txt, king.txt
# [!start-end], Matches any character not included from the till the end of a set, [!m-z]ing.*, king.db king.txt

# enable `extglob` shell option
shopt -s extglob
RESPONSE="Error: something went wrong."
if [[ $RESPONSE == +(Error)* ]]; then
    # Why this happening ??
    echo "Performing: failure handling"
    # anyways Fuck It !😁
else
    echo "Performing: success handling"
	# extglob examples
	#files=`ls !(*.txt|*.db`) # WHY IS THE SCRIPT EXECUTING THIS PIECE OF CODE !??
	#echo Files: $files
fi

echo // ================================================================================ //
echo    Switch Case type control flow
echo // ================================================================================ //

# enable `extglob` shell option
shopt -s extglob # THIS FUCKER KEEPS FAILING !!

# read what user's favourite planet
echo -n "Enter your favourite planet: "
read USER_PLANET
case "$USER_PLANET" in
  # match exactly `Earth`
  Earth)
    echo "Earth is where we live.";;
  # match exactly `Mars`
  Mars ) echo "Mars is where will go someday.";;
  # match anything
  * )
    echo "I am getting more information about this planet.";;
esac

fi # Execute Commands from here onwards...

echo // ================================================================================ //
echo    Positional Parameters 
echo // ================================================================================ //

# run => detailed-bash-examples.sh Apples Mangoes Lun
echo "\$0: $0"
echo "\$1: $1"
echo "\$2: $2"
echo "\$3: $3"

ACTION=$1
if [ "${#ACTION}" -eq 0 ]; then
    echo "Please provide an action. Length: ${#ACTION}"
fi

# All Args
echo "Args: $*"

# loop around arguments STRING
for ARG in "$*"; do
    echo "ARGS ITEM: $ARG"
done
# loop around arguments VECTOR
for ARG in "$@"; do
    echo "ARGV ITEM: $ARG"
done

echo // ================================================================================ //
echo    Functions 👊
echo // ================================================================================ //

##### Simple parameterless function
function hi_me(){
    echo "Hello `whoami`"
}
hi_me # Calling Function `hi_me` with no arguments

##### Calling a function with parameters
function show_fruits(){
    echo "Local Args: \$1:$1 | \$2:$2"
}
show_fruits Apple Oranges # The Function Call
echo "Global Args: \$1:$1 | \$2:$2"

##### Accessing Global and Local scoped variables from inside a function
FIRST_NAME='John'
LAST_NAME='Doe'
function say_hello() {
    FIRST_NAME=$1        # global scope
    local LAST_NAME=$2   # local scope
    echo "Hello, $FIRST_NAME $LAST_NAME"
}
echo "Before: FIRST_NAME: $FIRST_NAME, LAST_NAME: $LAST_NAME"
say_hello Ross Geller # The Function Call
echo "After: FIRST_NAME: $FIRST_NAME, LAST_NAME: $LAST_NAME"

##### Returning values from functions...
get_random(){
    END=$1 # first argument represents end digit
    # if $END is not empty
    # return number between `0` and `$END`
    if [ -n "$END" ]; then
        echo 'get_random() / context: if-block'
        return $(( $RANDOM % ( $END + 1 ) ))
    fi
    # if `END` is not provided, return $RANDOM
    echo 'get_random() / context: body'
    return $RANDOM
}
### These will return the function execution status code !
# call function
get_random
echo "get_random:" $?
# call function with 10 as argument
get_random 10
echo "get_random 10:" $?

### These will return the function values
echo "get_random: $( get_random )"      # using $()
echo "get_random 10: `get_random 10`"   # using ``














