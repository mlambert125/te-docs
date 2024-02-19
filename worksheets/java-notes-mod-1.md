# Mike's Notes - Java Module 1

This is a (mostly) complete set of notes for Tech Elevator's Java module 1 curriculum.
I have made an effort to ensure their accuracy and completeness, however, there
may be mistakes or additions.  If you have any, please contact me over Slack
(Michael Lambert) and let me know.

These notes are an expansion and cleanup of the previously posted mid-module
notes.

These notes do not aim to teach material (for that you'll have to rely on the
LMS, office hours, support resources, and your attention to your class time.)
Instead, these notes give a quick reference of all syntax covered with common
usage patterns/examples.

Some uses for these notes:

- Ensuring that you have an understanding of all material
- As a quick reference for syntax during exercises/tests
- As an example on how you might keep your own more personalized notes

Enjoy, and I  hope that you find these useful.  Any and all feedback is 
welcome.  

<div style="break-after: page"></div>


# Types and Variables 
## Primitive Types 
```java
int x = 4;                  // A basic whole number
long y = 9000000000;        // A large whole number
short z = 1000;             // A small whole number
byte b = 200;               // A very small whole number
float weight = 2.5;         // A decimal number
double height = 3.1415926;  // A large decimal numberm
boolean isValid = false;    // A true or false value
char input = 'F';           // A single character
```

## Common Object Types
```java
String name = "This is a string";
BigDecimal accountBalance = new BigDecimal("1024.66");
LocalDate date = LocalDate.of(1981, 1, 21);
```

## Array Types
```java
String[] names = new String[5];  // Initialize some size to default values
double[] scores = new double[] { 3.14, 5.3, 2.0 };  // Explicit values  
```

## Collection Types
```java
List<String> students = new ArrayList<String>(); // Empty list
List<Double> scores = List.of(1.0, 2.3, 3.0);    // Known values

Map<String, Double> studentScores = HashMap<String, Double>();
Map<String, Double> studentScores = Map.of("Bob", 1.2, "Claire", 3.0);

Set<String> uniqueValues = new HashSet<String>();
Set<String> uniqueValues = Set.of("test", "test2"); // Immutable

Stack<String> stack = new Stack<String>();
Queue<String> queue = new Queue<String>();
```

<div style="break-after: page"></div>

# Typecasting / Converting

## Integer to a double

```java
int x = 10;
double xAsDouble = (double)x;

// Can do this inline as well...
double result = 45 / (double)x;
```

## Double down to an int (drop digits after decimal)

```java
double x = 55.32;
int xAsInt = (int)x;    // 55
```

## String to a number type

```java
String userInput = "2234";
int inputAsInteger = Integer.parseInt(userInput);
double inputAsDouble = Double.parseDouble(userInput);

// or boolean even (case-insensitive)
String userInput = "TrUe";
boolean inputAsBoolean = Boolean.parseBoolean(userInput);
```

## Object Types (Castable if in same class heirerchy)

```java
Animal animal = new Dog("Fido");

Dog animalAsDog = (Dog)animal;
Cat animalAsCat = (Cat)animal;  // will compile, but err at runtime

// Check if item can convert (if class is in its type heirarchy)
// This will not error under any condition:
if (animal instanceof Cat) {
    Cat animalAsCat = (Cat) animal; 
}
```

<div style="break-after: page"></div>

# String Operations Pt. 1 (Basic)

## Concatenation

```java
String message = "Hello " + name;
```

## Comparison
```java
if (name.equals("Mike")) {
    // ...
}

// Case-insensitive
if (name.equalsIgnoreCase("mike")) {
    // ...
}
```

## Length
```java
String name = "Robert";
int length = name.length(); // NOTE: this is a method call, unline arrays
```

## StartsWith / EndsWith
```java
if (name.startsWith("Mik")) {

}
if (name.endsWith("ke")) {

}
```
<div style="break-after: page"></div>

# String Operations Pt. 2 (Find/Replace & Split/Join)

## Searching for position
```java
int ikPos = name.indexOf("ik");  // will be 1, since ik starts in the 1 pos
int xxPos = name.indexOf("xx"); // will be -1 for "not found" 
```

## Searching for existance (Contains)
```java
// 
if (name.contains("ik")) {

}
```

## Replace
```java
String newName = name.replace("ik", "x"); // newName will be "Mxe"
```

## Convert To Uppercase/Lowercase
```java
String lowName = name.toLower(); // mike
String upName = name.toUpper(); // MIKE
```

## Split into an array
```java
String vegetables = "carrot,tomato,cucumber,lettuce";
String[] vegetableArray = vegetables.split(",");
```

## Join an array of strings
```java
String vegetablesString = String.join(",", vegetablesArray);
```

<div style="break-after: page"></div>

# String Operations Pt. 3 (Substrings)

## Get a substring at some position
```java
String name = "Mike";
// we give the start index, and one after the end index
String secondTwo = name.subString(2, 4);  
```

## Get an ENDING substring
```java
// Just the index to start at, length is assumed to go to end
String end = name.subString(2);  // "ke"
```

## Get a STARTING substring
```java
String starting = name.subString(0, 3);  // "Mi"
```

## Get a substring of LAST 5 characters
```java
String ending = name.subString(name.length() - 5);
```

<div style="break-after: page"></div>

# BigDecimal Operations

## Creating 
```java
BigDecimal price = new BigDecimal("5.99");      // from string (preferred)
BigDecimal price2 = BigDecimal.valueOf(5.99);   // from double
```

## Convert to double
```java
BigDecimal pi = new BigDecimal("3.14");
double dPi = pi.doubleValue();
```


## Comparison
```java
// Equals (price1 == price2)
if (price.compareTo(price2) == 0) {
}

// Greater-than (price1 > price2)
if (price.compareTo(price2) > 0) {
}

// Less than (price1 < price2)
if (price.compareTo(price2) < 0) {
}
```

## Math Operations

- can not use operators like +-/=%
- must use big decimals for other numbers in calculation
- math methods **RETURN** the result, they do not modify the BigDecimal
  that they are called on

```java
BigDecimal halfPrice = price.divide(new BigDecimal("2"));
BigDecimal totalPrices = price.add(price2);
BigDecimal tax = price.multiply(new BigDecimal("0.0575"));

// Compound operations require nesting/chaining
BigDecimal average = price1.add(price2).divide(new BigDecimal("2"))
```

<div style="break-after: page"></div>

# LocalDate Operations

## Creation

```java
LocalDate date = LocalDate.of(1981, 1, 21);
LocalDate rightNow = LocalDate.now();
```

## Getting Parts

```java
int year = date.getYear();
int month = date.getMonthValue();
int day = date.getDayOfMonth();
```

## Comparison
```java
LocalDate date2 = LocalDate.of(1987, 7, 24);
if (date.equals(date2)) {

}

if (date2.isAfter(date)) {

}

if (date2.isBefore(date)) {

}
```

## Math
```java
LocalDate fiveMore = date.addDays(5);
LocalDate fiveLess = date.minusDays(5);
```
<div style="break-after: page"></div>

# Operators Pt. 1 (Arithmetic/String)

**NOTE** - Operators can ONLY be used on primitives and Strings.  You can not
use them with `BigDecimal` or `LocalDate` or any other object type.

## Assignment

```java
int x = 5;  // a single = is ALWAYS assignment
```

## Arithmetic

```java
int x = 1 + 1;      // addition
int y = x - 10;     // subtraction
int z = y * 10;     // multiplication
int q = z / 45      // division (whole number if all operands are ints)
double r = z / 3.9; // division (decimal if at least one is a double)
double s = z / (double) 45;    // force decimal division by casting
int remainder = 5 % 3;  // remainder of 5 / 3 (2)
```

## Arithmetic Assignment
```java
y += 5;     // same as y = y + 5;
y -= 10;    // same as y = y - 10;
y *= 3;
y /= 5;
y %= 3;

y++;        // same as y = y + 1;
y--;        // same as y = y - 1;
```

## Strings

```java
String fullName = firstName + lastName; // strings only have + for concatenation
```

<div style="break-after: page"></div>

# Operators Pt. 2 (Comparison)

Comparison operators are still just operators, they just evaluate to a `boolean`
(`true` or `false`)

## Basic Comparisons

```java
boolean isSixteen = age == 16;  // == compares primitives for equality 
boolean isAdult = age > 18;     // Greater than
boolean isChild = age < 18;     // Less than
boolean isEnough = amount >= 3; // Greater than or equal to
boolean isLow = amount <= 2;    // Less than or equal to
boolean isHigh = !isLow;        // ! flips a true to a false and vice versa
```

## Compound Operators 

```java
// && AND - True if both sides are true
boolean isTeenager = age >= 13 && age <= 19; 

// || OR - True if either side or both sides are true
boolean isNotTeen = age < 13 || age > 19; 

// ^^ XOR - True if one side is true and one side is false
boolean discount = age > 65 ^^ frequentFiler;
```

## Combining Several

```java
// Use paretheses to group/clarify compound conditions
boolean pass = (isTeenager && discount) || (age > 65); 
```

## Usage in Conditionals/Loops

```java
if (x > 3) {
    // do once if condition is true
}

while (x > 3) {
    // repeat as long as condition is true
}
```

<div style="break-after: page"></div>

# Operators Pt. 3 (Ternary)

## Basics 

Ternaries are a compound operator with three parts separated by a 
`?` and a `:`:

```
<condition> ? <true-value> : <false-value>
```

A ternary expression looks at its condition, and if it is true, the 
whole expression evaluates to the `true-value`, but if it is false, 
the whole expression evaluates to the `false-value`.

```java
// Kind of like an inline if statement in expression form
String ageGroup = (age > 18) ? "Adult" : "Child";
```

## Chaining

Ternaries can be chained to choose between multiple choices:

```java
// (Kind of like an inline if/else in expression form)
String ageGroup =
    (age > 18) ? "Adult" :
    (age > 12) ? "Teenager" :
    "Child";
```

<div style="break-after: page"></div>

# Conditionals

## If
```java
// The conditional part is a boolean or an expression that evaluates to one
if (x > 33) { 
    // do something if the condition is true
    // otherwise, skip this block
}
```
## Else
```java
if (name.equalsIgnoreCase("Joe")) {
    // do something if condition is true
} else {
    // do something if condition is false
}
```
## Else If
```java
if (name.equalsIgnoreCase("Joe")) {
    // do something if condition is true
} else if (name.equalsIgnoreCase("Joan")) { 
    // do something if first failed, but this was true
} else {
    // do something if none of the above are true
}
```

## Conditions Are Just Boolean Expressions:

```java
boolean validEntry = false;

// Don't do this
if (validEntry == true) {
    // ...
}

// Do this:
if (validEntry) {
    // ...    
}
```

<div style="break-after: page"></div>

# Loops

## While loops
```java
while (x > 5) {  // Repeat as long as condition is true
    x++;
}
```

## For loops (for COUNTING)
```java
for (int i = 0; i < 10; i++) {
    // Loop from 0-9, storing current value in i
    System.out.println("#" + i);
}
```

## For loop (over an array index)
```java
// use .length for arrays, but use .size() for other collections
// (ArrayList, Queue, etc.)
for (int i = 0; i < students.length; i++) {
    String currentStudent = students[i];

    // Remember, i is the INDEX, not the ITEM in the array
}
```

## For each loop (over an array or collection type)
```java
for (String currentStudent : students) {
    // same as previous ^
}
```

**NOTE:** In general, we prefer to use a for-each loop over an 
array/collection, but if we need the **index** as well as the current item, 
in which case we use a standard for loop.

<div style="break-after: page"></div>

# Array Loop Tricks Pt. 1 (Iterations)

## Loop over every other item in an array
```java
for (int i = 0; i < students.length; i += 2) {
    String currentStudent = students[i];
}
```

## Loop backwards
```java
for (int i = students.length - 1; i >= 0; i--) {
    String currentStudent = students[i];
}
```

## Loop over groups of 3

```java 
for (int i = 0; i + 2 < students.length; i += 3) {    
    String studentA = students[i];
    // Use ternaries to set them to null if we don't have enough 
    String studentB = (students.length > i + 1) ? students[i + 1] : null;
    String studentC = (students.length > i + 2) ? students[i + 2] : null;
}
```

## Using mod to repeat cycles for every 3 items

```java
String seats = new String[10];

for (int i = 0; i < seats.length; i++) {
    if (i % 3 == 0) {           // 0, 3, 6, 9...
        seat[i] = "Aisle";
    } else if (i % 3 == 1) {    // 1, 4, 7, 10...
        seat[i] = "Middle";
    } else if (i % 3 == 2) {    // 2, 5, 8, 11...
        seat[i] = "Window";
    }
}
```

<div style="break-after: page"></div>

# Array Loop Tricks Pt. 2 (Aggregations)

## Sum
```java
double total = 0;

for (int i = 0; i < items.length; i++) {
    total += items[i];    
}
```

## Max
```java
double max = items.length > 0 ? items[0] : 0;

for (int i = 1; i < items.length; i++) {
    if (items[i] > max) {
        max = items[i];
    }
}

// or more simply:
Collections.max(Arrays.asList(items));
```

## Min
```java
double min = items.length > 0 ? items[0] : 0;

for (int i = 1; i < items.length; i++) {
    if (items[i] < max) {
        min = items[i];
    }
}

// or more simply:
Collections.min(Arrays.asList(items));
```


<div style="break-after: page"></div>

# Collections Pt. 1 - ArrayList, HashSet

## ArrayList

Like an array, but can add/remove items to grow/shrink the `ArrayList`.

```java
// See "Declarations" page for more on this...
List<String> students = List.of("Mike", "Steve", "Brian");

// Add / Remove
students.add("Janet");
students.remove("Brian");

// Loop
for (String student : students) {
    System.out.println(student);
}

// Contains
if (students.contains("Mike")) {
    
}
```

## HashSet

Like an array list but ignores duplicates

```java
Set<String> students = new HashSet<String>();

// Add / Remove
students.add("Mike");
students.add("Janet");
students.add("Brian");
students.add("Brian");      // ignored
students.remove("Mike");

// Loop
for (String student : students) {
    System.out.println(student);
}

// Contains (very fast for HashSet)
if (students.contains("Mike")) {
    
}
```

<div style="break-after: page"></div>

# Collections Pt. 2 - HashMap

## HashMap

Lets you store a list of values, like an array list, but you can give each
item a lookup key of some type.

```java
// See "Declarations" page for more on this...
Map<String, double> scores = Map.of("Mike", 2.0, "Steve", 3.0);

// Add/Remove
scores.put("Janet", 2.8);
scores.remove("Steve");

// Loop
for(Map.Entry<String, double> score : scores.entrySet()) {
    String currentKey = score.getKey();
    double currentValue = score.getValue();
}

// Contains
scores.containsKey("Mike");

// Get an item value by key
double score = scores.get("Mike");
```

<div style="break-after: page"></div>

# Collections Pt. 3 - Stack / Queue
## Queue

Special collection for holding items that are going to be iterated
once, and where iterating them removes them in first-in-first-out order.

```java
Queue<String> customers = new LinkedList<String>();

// Adding
customers.offer("Bob");
customers.offer("Corey");

// Loop / Remove
while (customers.size() > 0) {
    // Gets next and removes it
    String customer = customers.poll();
}
```

## Stack

Special collection for holding items that are going to be iterated
once, and where iterating them removes them in last-in-first-out order.

```java
Stack<String> tasks = new Stack<String>();

// Adding
tasks.push("Make dinner");
tasks.push("Go to store");
tasks.push("Put gas in car");

while (tasks.size() > 0) {
    // Pop reads AND removes the LAST item (gas first, etc.)
    String currentTask = tasks.pop();
    System.out.println("Now doing task: " + currentTask);
}
```

<div style="break-after: page"></div>

# Basic Methods (Functions)

## Method declaration and calling.

```java
// The form for declaring a static method:
//    public static RETURNTYPE NAME(TYPE ARGNAME, TYPE ARGNAME, ...)

// The square function "takes" one parameter.  An int, that will be
// referred to as "x" for the body of the method.
public static int square(int x) {
    int result = x * x;

    // Here, we return the result.  We go back to where
    // we were called from and replace the call with this value
    return result;
}

public static void main(String[] args) {
    // Here, we "call" square and pass 5 as the first parameter
    // this transfers control to the square function.  When it
    // returns, we wil replace "square(5)" with the value that
    // was returned from square
    int fiveSquared = square(5);
}
```

## Void methods

```java
// This method has a return type of void.  This means
// it is just used to go do something, and doesn't have 
// any return value that it gives back to the caller.
public static void promptUser(String name) {
    System.out.println("Hello " + name);

    // We can put return with nothing like this:
    return;

    // But we could also ommit this return for void methods,
    // and if we reach the end of the body, the return is implied
}

public static void main(String[] args) {
    // Here, we are calling the function and we aren't
    // storing its return value in a variable, because it
    // doesn't return anything
    sayHi("Mike");
}
```

<div style="break-after: page"></div>

# Input / Output

## Basic Output
```java
System.out.println("Hello World!");
```

## Input with Prompt
```java
Scanner scanner = new Scanner(System.in);
System.out.println("What is your name?");
String userInput = scanner.nextLine();
```

## Prompting for a number:
```java
Scanner scanner = new Scanner(System.in);
System.out.println("What is your name?");
String userInput = scanner.nextLine();
double userValue = Double.parseDouble(userInput);
```

### Reprompting until valid

```java
Scanner scanner = new Scanner(System.in);
int userValue = 0;

while (true) {
    System.out.println("Enter a number from 1-10");
    String userInput = scanner.nextLine();
    userValue = Integer.parseInt(userInput);

    if (userValue >= 1 && userValue <= 10) {
        break;
    } else {
        System.out.println("Invalid value");
    }
}

```

<div style="break-after: page"></div>

# Input/Output Example: Menuing System

```java
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String choice;
        while (true) {
            System.out.println("1. SubMenu A");
            System.out.println("2. SubMenu B");
            System.out.println("3. Exit");
            choice = scanner.nextLine();

            if (choice.equals("1")) {
                while (true) {
                    System.out.println("1. Choice A1");
                    System.out.println("2. Choice A2");
                    System.out.println("3. Return to Main Menu");
                    choice = scanner.nextLine();

                    if (choice.equals("1")) {
                        // Process A1...
                    } else if (choice.equals("2")) {
                        // Process A2
                    } else if (choice.equals("3")) {
                        // Break out of submienu loop to outer main loop
                        break;
                    } else {
                        System.out.println("Invalid Choice");
                    }
                }
            } else if (choice.equals("2")) {
                while (true) {
                    System.out.println("1. Return to Main Menu");
                    choice = scanner.nextLine();

                    if (choice.equals("1")) {
                        // Break out of submienu loop to outer main loop
                        break;
                    } else {
                        System.out.println("Invalid Choice");
                    }
                }
            } else if (choice.equals("3")) {
                // Break out of top loop and end program
                break;
            } else {
                System.out.println("Invalid Choice");
            }
        }
    }
```

<div style="break-after: page"></div>

# Classes - Basic

## Basic Declaration

Classes let us define our own types that have sub-properties (members) and 
methods for interacting with an instance of the type.

```java
public class Person {
    // Members (best practice - make private
    private String name;
    private int age;

    // Getters and Setters for accessing members
    public String getName() { return this.name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return this.age; }

    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Overloaded constructor (same name, diff params)
    public Person(String name) {
        this.name = name;
        this.age = 18;  // no age provided, default to 18
    }

    // Other instance methods...
    public void print() {
        System.out.println("Name: " + this.name + ", Age: " + this.age);
    }
}
```

## Usage:

```java
public class Application {
    public static void main(String[] args) {
        Person p1 = new Person("Bob", 55);
        Person p2 = new Person("Corey", 37);

        p1.print();
        p2.print();
    }
}
```

<div style="break-after: page"></div>

# Classes - Static Methods

## Declaration

```java
public class Person {
    // Members 
    private String name;
    private int age;

    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Other methods...
    public void print() {
        System.out.println("Name: " + this.name + ", Age: " + this.age);
    }

    // Static methods (require no instance, called on Type name)
    public static void printListHeading() {
        System.out.println("--------------------");
        System.out.println("People");
        System.out.println("--------------------");
    }
}
```

## Usage:

```java
public class Application {
    public static void main(String[] args) {
        Person p1 = new Person("Bob", 55);
        Person p2 = new Person("Corey", 37);

        Person.printListHeading(); // Called on Person, not "a" person
        p1.print();
        p2.print();
    }
}
```

<div style="break-after: page"></div>

# Classes - Inheritance

```java
// See "Classes - Basic" for Person class

public class Student extends Person {
    private double score;

    public Student(String name, int age, double score) {
        // Pass the name/age to the Person constructor to let it do 
        // its thing
        super(name, age);

        // Set our additional properties
        this.score = score;
    }

    // Override print method
    public void print() {
        // Call the print method in Person
        super.print();

        // Add our own line
        System.out.println("Score: " + this.score);
    }
}
```

## Usage:

```java
public class Application {
    public static void main(String[] args) {
        Person p1 = new Person("Bob", 55);
        Person p2 = new Student("Corey", 37, 2.5);

        Person.printListHeading(); 
        p1.print();
        p2.print(); // Calls the print method in Student, not Person
    }
}
```

<div style="break-after: page"></div>

# Classes - Polymorphism

Objects of a subclass can be treated as a parent class.  They still retain
their real type at runtime, but are "treated as" their parent type with those
rules at compile time.

```java
public class Application {
    public static void main(String[] args) {
        // See "Classes Basic" and "Classes Inheritance" for 
        // class definitions

        Person p1 = new Person("Bob", 55);
        // Actually is a Student, but can be stored in person variable
        Person p2 = new Student("Corey", 37, 2.5);

        // We can put them in a list together...
        List<Person> people = new ArrayList<Person>();
        people.add(p1);
        people.add(p2);

        // We can pass a student to a function that takes a Person      
        printPersonName(new Student("Test", 5, 1.5));  
    }

    public static void printPersonName(Person p){
        System.out.println(p.getName());
    }
}
```

<div style="break-after: page"></div>

# Classes - Interfaces

Interfaces let us define common behaviors that objects share outside of
the class heirerchy.

## Declaration

```java
public interface Printable {
    void print();
}

public class Student extends Person implements Printable {
    // (See "Classes - Inheritance" for implementation)
}

public class Car implements Printable{
    public void print() {
        System.out.println("vroom vroom...");
    }
}
```

## Usage

```java
public class Application {
    public static void main(String[] args) {
        Car car = new Car();
        Student student = new Student("Mike", 43, 2.8);

        // car and student share nothing in common in class heirerchy,
        // BUT they both implement the printable interface, so both can 
        // be passed here
        printThreeTimes(car);
        printThreeTimes(student);

        // We could even put them in a list together, but would only
        // be holding them as printables (only could call print)
        List<Printable> myThings = new ArrayList<Printable>();
        myThings.add(car);
        myThings.add(student);
    }

    public void printThreeTimes(Printable printable) {
        for (int i = 0; i < 3; i++) {
            printable.print();
        }
    }
}
```

<div style="break-after: page"></div>

# Unit Testing - Basics

## Class 
```java
public class Calculator {
    public int add(int x, int y) { return x + y; }
    public int sub(int x, int y) { return x - y; }
}
```

## Test Class
```java
public class CalculatorTest {
    public void testAdd_2_2() {
        // Arrange (Create class)
        Calculator calc = new Calculator();

        // Act (Call method)
        int result = calc.add(2, 2);

        // Assert (test passes if this assertion is true, fails otherwise)
        Assert.assertEquals("2+2 should equal 4", 4, result); 
    }

    public void testAdd_4_5()) {
        // Arrange (Create class)
        Calculator calc = new Calculator();

        // Act (Call method)
        int result = calc.add(4, 5);

        // Assert (test passes if this assertion is true, fails otherwise)
        Assert.assertEquals("4+5 should equal 9", 9, result); 
    }
}
```

## Notes
- The `Assert` class has many other methods such as `assertTrue`, 
  `assertArrayEquals`, etc.  They are not listed here as they are easy to see 
  in IntelliJ's autocomplete list
- You can make MULTIPLE assertions in one method, but should only have one
  "act" per class.  (Should not test multiple inputs in one test method.)


<div style="break-after: page"></div>

# Unit Testing - Edge Cases

```java
    /*
    When squirrels get together for a party, they like to have cigars. 
    A squirrel party is successful when the number of cigars is between 
    40 and 60, inclusive. Unless it is the weekend, in which case
    there is no upper bound on the number of cigars. Return true if 
    the party with the given values is successful, or false otherwise.
    */
    public boolean haveParty(int cigars, boolean isWeekend) {
        boolean hasMinimumCigars = cigars >= 40;
        boolean withinMaxRangeOfCigars = 
            (!isWeekend && cigars <= 60) || isWeekend;
        boolean successful = hasMinimumCigars && withinMaxRangeOfCigars;

        return successful;
    }
```

In this example, we would look at each parameter and find "interesting" values
or "edge cases" where things change. 

For the `boolean isWeekend` parameter, this is simple - we need to test 
`true` and `false`.

The `int cigars` parameter, there are change sin the problem description at
two points: `39,40`, and `60,61`.  So use all of those values for edge values.

The test matrix and expected results can be drawn out like this

|           | isWeekend == true | isWeekend == false |
|-----------|-------------------|--------------------|
|cigars = 39| false             | false              |
|cigars = 40| true              | true               |
|cigars = 60| true              | true               |
|cigars = 61| true              | false              |

We need to test all combinations, so we'd write 8 tests for edge cases in 
this problem.

<div style="break-after: page"></div>

# Unit Testing - Special Values

As well as testing edge cases in the algorithm description of a problem,
you may also want to test the following special values that can cause 
unexpected problems for any method that the type in question appears in:

| type                        | Special values       |
|-----------------------------|----------------------|
| numeric (int, double, etc.) | 0, 1, -1             |
| boolean                     | true, false          |
| String                      | "", null             |
| Objects (non-primitivetypes)| null                 | 

<div style="break-after: page"></div>

# Exceptions - Handling

## Basic catch-all (Using most-generic type `Exception`)

```java
try {
    // Code that may raise an exception 
    // (stop and jump to catch block immediately when an error happens)
    step1();
    step2();
    step3();
    System.out.println("Everything went okay!");
} catch (Exception ex) {
    // Code to handle exception
    System.out.println("Error: " + ex.getMessage()); // we can get the msg
}
```

## Handling specific Exceptions differently

Only the first applicable `catch` block is run.

```java
try {
    // Code that may raise any of a number of exceptions 
} catch (ArithmeticException ex) {
    // Code to handle an ArithmeticException
} catch (MyException) {
    // Code to handle a MyException
} catch (Exception ex) {
    // Code to handle any other kind of exception
}
```

## Example - Prompt Retry Pattern
```java
Scanner scanner = new Scanner(System.in);
double number = 0;
while (true) {
    try {
        System.out.println("Enter number: ");
        number = Integer.parseInt(scanner.nextLine());
        break; // break if we got here without issue 
    } catch (Exception ex) {
        System.out.println("Invalid number - try again");
    }
}
```

<div style="break-after: page"></div>

# Exceptions - Defining/Throwing

## Custom Exception
```java
public class InvalidFruitException extends Exception {
    public InvalidFruitException(String msg) {
        super(msg);
    }
    // Can put other properties/methods here if we want just like any class
}
```

## Throwing
```java
public class Application {
    Scanner scanner = new Scanner(System.in);
    // ...
    public static String promptForFruit() throws InvalidFruitException {
        System.out.println("Enter a fruit name");
        String fruit = scanner.nextLine();

        if (!Set.of("apple", "grape", "banana").contains(fruit)) {
            throw new InvalidFruitException("The fruit is invalid");
        }
    }
}
```

## Checked Vs. Unchecked / Throws clause

Most exceptions (including all custom ones) are "checked."  This means that
if you throw them or call code that throws them, you must either wrap that
code in a `try/catch` or you must append a `throws` clause on your function
to pass the responsiblity for handling the exception up to the caller of
your function.  The example above includes this clause because it is 
`throw`ing without handling.

## Defensive Coding

In general, throwing or passing exceptions up shoudl be avoided where 
possible.  The exceptional case should be avoided or handled
at the lowest level possible.


<div style="break-after: page"></div>

# File IO

## Reading a text file line by line

```java
File dataFile = new File("myFile.txt");
try (Scanner dataScanner = new Scanner(dataFile)) {
    while (dataScanner.hasNextLine()) {
        String currentLine = scanner.nextLine();

        // Process the line...
    }
} catch (FileNotFoundException) {
    System.out.println("File not found");
}
```

## Writing to a NEW text file

This will always make a new file or completely overwrite an existing file.

```java
File dataFile = new File("myFile.txt");

try (PrintWriter dataOutput = new PrintWriter(dataFile)) {
    dataOutput.println("Writing the first line of the file");
    dataOutput.println("Writing the second line of the file");
} catch (FileNotFoundException e) {
    System.err.println("Cannot open the file for writing.");
}
```

## Appending to a text file

This will create a new file, or if it exists, keep the file and write new
data to the end.

```java
File dataFile = new File("myFile.txt");

try (PrintWriter dataOutput = new PrintWriter(new FileOutputStream("myFile.txt", true))) {
    dataOutput.println("Writing the first new line of the file");
    dataOutput.println("Writing the second new line of the file");
} catch (FileNotFoundException e) {
    System.err.println("Cannot open the file for writing.");
}
```