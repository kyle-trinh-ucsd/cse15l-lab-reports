
echo "-----START OF AUTOGRADER-----"
echo ""
rm -rf student-submission         # Removes working directory to be used
echo "[SUCCESS] Sample Directory Removed"
git clone $1 student-submission   
echo "[SUCCESS] Git repo cloned"

# Clone the inputted repo to be tested
# Will create a ./student-submission directory

FILE="ListExamples.java"
SCORE=0

# For debugging code
    # mkdir student-submission
    # cp $FILE student-submission
    # echo "TEST FILE COPIED"

# Checks if the file exists.
echo "Finding $FILE..."
cd student-submission
if test -f "$FILE"; then
    echo "[SUCCESS][+1] Find -> ListExamples.java"
    SCORE=$[SCORE+1]
    echo "Score: " $SCORE / 4

else 
    echo "[FAILED] Find -> ListExamples.java"
    echo "Score:" $SCORE / 4
    exit
fi
cd ..

# Copy our code into the student-submission
cp "TestListExamples.java" student-submission
echo "[SUCCESS] Initialization Files Copied"


# Check if the file actually compiles.
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" ./student-submission/*.java
if [ $? -eq 0 ]; then
    echo "[SUCCESS][+1] Compile -> $FILE"
    SCORE=$[SCORE+1]
    echo "Score: " $SCORE / 4

else
    echo "[FAILED] Compile -> $FILE"
    echo "Score:" $SCORE / 4
    exit
fi

# RUN TESTS

echo ""
echo "RUNNING PROGRAM NOW"

cd student-submission
java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
if [ $? -eq 0 ]; then
    echo "All tests passed!"
    SCORE=$[SCORE+2]
    echo "Score: " $SCORE / 4

else
    echo "Not all tests passed"
fi 
echo "------------"
echo "TEST ARE DONE RUNNING!"
echo "Score: " $SCORE / 4

cd ..
javac GradeServer.java Server.java
java GradeServer 4000