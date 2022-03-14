# Composite Number Spreadsheet

## Objectives
1. Designing and implementing procedures
2. Designing and implementing loops
3. Writing nested loops
4. Understanding data validation

## Problem Definition
Write a program to calculate composite numbers. First, the user is instructed to enter the number of composites to be displayed, and is prompted to enter an integer in the range [1 .. 300]. The user enters a number, n, and the program verifies that 1 ≤ n ≤ 300. If n is out of range, the user is re-prompted until they enter a value in the specified range. The program then calculates and displays all of the composite numbers up to and including the nth composite. The results should be displayed 10 composites per line with at least 3 spaces between the numbers.

## Requirements
1. The programmer’s name must appear in the output.
2. The counting loop (1 to n) must be implemented using the MASM loop instruction.
3. The main procedure must consist (mostly) of procedure calls. It should be a readable “list” of what the program will do.
4. Each procedure will implement a section of the program logic, i.e., each procedure will specify how the logic of its section is implemented. The program must be modularized into at least the following procedures and sub-procedures:
    - introduction
    - getUserData
      - validate
    - showComposites
      - isComposite
    - goodbye
5. The upper limit should be defined and used as a constant.
6. Data validation is required. If the user enters a number outside the range [1 .. 300] an error message should be displayed and the user should be prompted to re-enter the number of composites.
7. Each procedure must have a procedure header that follows the format discussed during lecture.
8. The usual requirements regarding documentation, readability, user-friendliness, etc., apply.

## Notes
1. For this program, you may use global variables instead of passing parameters. This is a one-time relaxation of the standards so that you can get accustomed to using procedures. In future homework, global variables will not be allowed.
2. A number k is composite if it can be factored into a product of smaller integers. Every integer greater than one is either prime or composite. Note that this implies that
    - 1 is not composite.
    - The number must be positive.
3. If you choose to use the LOCAL directive while working on this program be sure to read section 8.2.9 in the Irvine textbook. LOCAL variables will affect the contents of the system stack!

Example Program Operation

```
Welcome to the Composite Number Spreadsheet
Programmed by Author Name
This program is capable of generating a list of composite numbers.
Simply let me know how many you would like to see.
I’ll accept orders for up to 300 composites.
How many composites do you want to view? [1 .. 300]: 400
Out of range. Please try again.
How many composites do you want to view? [1 .. 300]: 0
Out of range. Please try again.
How many composites do you want to view? [1 .. 300]: 23
4   6   8   9   10   12   14   15   16   18
20   21   22   24   25   26   27   28   30   32
33   34   35
Thanks for using my program!
```

## Extra Credit Option (original definition must be fulfilled)
- (2 pts) When the program runs, give the user the option to display only composite numbers that are also odd numbers. The user should get a choice when the program first starts (e.g. enter 0 to view all composite numbers or enter 1 to view only odd composites). For example, if the user chooses to view only odd composites, they would see the numbers 9,   15,   21,   25,   27,   33,   35,   39,   45...

Remember, in order to ensure you receive credit for any extra credit work, you must add one print statement to your program output PER EXTRA CREDIT which describes the extra credit you chose to work on. You will not receive extra credit points unless you do this. The statement must be formatted as follows...

```
--Program Intro--
**EC: DESCRIPTION
--Program prompts, etc--
```

Please refer back to the documentation for Program 1 to see a sample of the extra credit format.
