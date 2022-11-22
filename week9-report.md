# Week 9 Report
---

My `grade.sh` code:

```bash
set -e

echo "-----START OF AUTOGRADER-----"
echo ""
rm -rf student-submission         # Removes working directory to be used
echo "[SUCCESS] Sample Directory Removed"
git clone $1 student-submission   
echo "[SUCCESS] Git repo cloned"

# Clone the inputted repo to be tested
# Will create a ./student-submission directory

FILE="ListExamples.java"

# For debugging code
    # mkdir student-submission
    # cp $FILE student-submission
    # echo "TEST FILE COPIED"

# Checks if the file exists.
echo "Finding $FILE..."
cd student-submission
if test -f "$FILE"; then
    echo "[SUCCESS] Find -> ListExamples.java"
else 
    echo "[FAILED] Find -> ListExamples.java"
    exit
fi
cd ..

# Copy our code into the student-submission
cp "TestListExamples.java" student-submission
echo "[SUCCESS] Initialization Files Copied"


# Check if the file actually compiles.
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" ./student-submission/*.java
if [ $? -eq 0 ]; then
    echo "[SUCCESS] Compile -> $FILE"
else
    echo "[FAILED] Compile -> $FILE"
    exit
fi

set +e 

# RUN TESTS

echo ""
echo "RUNNING PROGRAM NOW"

cd student-submission
java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
if [ $? -eq 0 ]; then
    echo "All tests passed!"
else
    echo "Not all tests passed"
fi
echo "------------"
echo "TEST ARE DONE RUNNING!"

```

### Student 1 Output:

![Student 1 Output:](/week9-pictures/student1-output.png) 

### Student 2 Output:

![Student 1 Output:](/week9-pictures/student2-output.PNG)

### Student 3 Output:

![Student 3 Output:](/week9-pictures/student3-output.PNG)

## `grade.sh` code trace:

On the first example, `grade.sh` sets up the code by letting the user know what it has run already. It also sets up the directory to clone the repository and grade it. This consists of the first 19 lines. Line 5 returns `0` for the error code for the first example.

The code then re-orients itself into the correct directory checking if the file exists in the correct directory. The `if` statement on line 22 returns an error code of 0 in this example as it should run properly. The bash script then returns the score up until that point.

Next, it will then copy the code into our working directory for it to grade; this happens in line 35. Now, it begins to compile the files on line 40. If it returns an exit code of 0, in which it does in the case of the first example, it will compile. Thus, at line 44, the code returns the grade once more.

Now, the program will begin to run the tests from `TestListExamples.java`, announcing the user on line 55. Then, on line 58 it will set the classpath and run the files properly. However, in this case, the exit code should be `1` since it fails the test in the student example. As such, it runs the else statement in line 64, telling the user that not all tests have passed. Moving on, the program finishes on lines 67 to 71 to tell the user it is done grading and returns the score of 2/4.