---
mmarp: true
theme: default 
style: |
    @import 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css'
---

![bg opacity:25%](images/bg-flourish.jpg)
# Module 1 - Week 2
## Arrays, Loops, Classes, CLI

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Welcome Back!

- Happy Holidays <i class="fa-solid fa-gift"></i>
- Don't be discouraged!

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Arrays (Basic Syntax) 

Make an array of five student scores and populate it with some values.

```java
int[] studentScores = new int[5];

studentScores[0] = 88;
studentScores[1] = 77;
studentScores[2] = 63;
studentScores[3] = 52;
studentScores[4] = 100;
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# Arrays (Initialize Syntax)

Same thing, but with initialize syntax {}

```java
int[] studentScores = new int[] { 88, 77, 63, 52, 100 };
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# While Loops

Printing out the numbers from 0-9 to the screen

```java
int i = 0;

while (i < 10) {
    System.out.println(i);
    i++;
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# For Loops

Printing out the numbers from 0-9 to the screen.

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# Arrays Without For Loops :(

Create the student scores array and print all of the scores to the screen

```java
int[] studentScores = new int[] { 88, 77, 63, 52, 100 };

System.out.println(studentScores[0]);
System.out.println(studentScores[1]);
System.out.println(studentScores[2]);
System.out.println(studentScores[3]);
System.out.println(studentScores[4]);
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# Arrays With For Loops :)

Same thing, but a bit nicer.

```java

int[] studentScores = new int[] { 88, 77, 63, 52, 100 };

for (int i = 0; i < 5; i++) {
    System.out.println(studentScores[i]);
}   
```


---

![bg opacity:25%](images/bg-green-wave.jpg)
# Arrays With For Loops and array.length :)

Same thing, but even nicer.

```java

int[] studentScores = new int[] { 88, 77, 63, 52, 100 };

for (int i = 0; i < studentScores.length; i++) {
    System.out.println(studentScores[i]);
}   
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Break

Getting out of a loop early

```java

int[] studentScores = new int[] { 88, 77, 100, 52, 100 };

boolean hasPerfectScore = false;

for (int i = 0; i < studentScores.length; i++) {
    if (studentScores[i] == 100) {
        hasPerfectScore = true;
        break;
    }
}

System.out.println("Contains perfect score " + hasPerfectScore);
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# Continue

Going to the next item in a loop early

```java
int[] testScores = new int[] { 100, 94, 0, 87, 88, 0};

int sum = 0;
int scoreCount = 0;

for (int i = 0; i < testScores.length; i++) {
    if (testScores[i] == 0) {
        continue; 
    }
    sum += testScores[i];
    scoreCount++;
}
```
--- 

![bg opacity:25%](images/bg-green-wave.jpg)
# Command-line (Terminal) Programs

- Run in the terminal.
- Entirely run on keyboard input and terminal output.

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Writing Output

```java
System.out.println("Hello World!");
```
---

![bg opacity:25%](images/bg-green-wave.jpg)
# Reading Input

**Note** - Input will always be a `String`

```java
Scanner input = new Scanner(System.in);

System.out.println("Enter your name: ");
String userInput = input.nextLine();
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Parsing

Converting user input into more useful data types/shapes:

- Converting a string to a number
- Converting a single string with commas in it into a String array
- Converting a single string with commas in it into an int array

---

![bg opacity:25%](images/bg-green-wave.jpg)
# String to an int 


```java
Scanner input = new Scanner(System.in);

System.out.println("Enter your age: ");
String userInput = input.nextLine();

int age = Integer.parseInt(userInput);

System.out.println("In 5 years, you will be " + (age + 5));
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Splitting a String

```java

System.out.println("Enter a comma separated list of your favorite colors:");
String userInput = input.nextLine();

String[] favoriteColors = userInput.split(",");

for (int i = 0; i < favoriteColors.length; i++) {
    System.out.println(favoriteColors[i]);
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Built-In Non-Primitive Types (Classes)

- String - For words/text.
- BigDecimal - For infinitely big numbers.
- LocalDate - For storing Dates

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Instantiating

Usually, we create a new value of a class with the `new` keyword.

```java
BigDecimal a = new BigDecimal("9.3234324");
```

But sometimes, we use a static method on the class to create it.

```java
LocalDate now = LocalDate.now();
LocalDate birthdate = LocalDate.of(1981, 1, 21);
```

And for strings, we just type the string value in quotes:

```java
String name = "Michael";
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Methods

Methods are functions that belong to a class.  There are two kinds of methods:

- Static Methods: Get called on the class itself
```java
LocalDate now = LocalDate.now();
```
- Instance Methods: Get called on an instance of the class (an object)
```java
String names = "Mike, Marlen, Anthony";
String[] names_list = names.split(","); 
```



