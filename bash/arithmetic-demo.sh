#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

#asking the user for three numbers and assigning them to variables
echo "this program will ask you for three random numbers, please enter your first number now";read firstnum
echo "please enter your second number now";read secondnum
echo "please enter your final number";read thirdnum

#assigning variables to the sum and product of the three numbers
sum=$(($firstnum + $secondnum + $thirdnum))
product=$(($firstnum * $secondnum * $thirdnum))

#displaying the sum and the product of the three numbers with labels
cat <<EOF
the sum of your three numbers is $sum
the product of your three numbers is $product

EOF
