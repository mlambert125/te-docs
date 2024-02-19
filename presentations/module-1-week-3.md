---
marp: true
theme: default 
style: |
    @import 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css'
---
 
![bg opacity:25%](images/bg-flourish.jpg)
# Module 1 - Week 3
## Collections 

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Built-in libraries 

- There are many libraries organized under dot-delimited namespaces:
    - java.util
    - java.io
    - java.text
    - java.util.regex


- Without Imports we have to use the full name of these.


```java

// No imports, just use the really long qualified name
java.util.Scanner input = new java.util.Scanner(System.in);
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Importing

- When we want to use a library that provides extra functionality
- There are many built-in

```java
// import individual things that we need
import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;
```

Or, more conveniently:

```java
// Just go get everything in utils.
import java.util.*;
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Collections

- Much better/easier than arrays
- We can add/remove, so they can grow/shrink
- Use "generic syntax", where we specify the item type in &lt;&gt;
- We'll learn a few:
    - ArrayList - An array that can shrink/grow
    - Set - Stores unique items
    - Map - Store each value with a (usually String) key
    - Stack - Special purpose FIFO
    - Queue - Special purpose LIFO

---

![bg opacity:25%](images/bg-green-wave.jpg)
# ArrayList / List

We can add/remove items, and use a special new loop to iterate:

```java
import java.util.*;

public class Application {
    public static void Main(String[] args) {
        List<String> names = new ArrayList<String>();
        names.add("Luke");
        names.add("Leia");
        names.add("Han");

        names.remove("Han");

        for (String name : names) {
            System.out.println(name);
        }

        String firstName = names.get(0);
        String lastName = names.get(names.length() - 1);
    }
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# HashSet / Set

Same as ArrayList, but duplicates are ignored when adding.

```java
import java.util.*;

public class Application {
    public static void Main(String[] args) {
        Set<String> names = new HashSet<String>();
        names.add("Luke");
        names.add("Leia");
        names.add("Luke");

        for (String name : names) {
            System.out.println(name);
        }

        if (names.contains("Chewbacca")) {
            System.out.println("Wookie present");
        }
    }
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# HashMap / Map

Like an ArrayList with keys associated with each item.  We can access items by key.

```java
import java.util.*;

public class Application {
    public static void Main(String[] args) {
        Map<String, double> studentScores = new HashMap<String, double>();

        studentScores.put("Ani", 2.8);
        studentScores.put("Helena", 3.0);
        studentScores.put("Vartan", 1.5);
        studentScores.put("Armine", 2.5);

        // If we put something that is already there, put will updated it
        // and will return the previous value (if that's useful.)
        double previousValue = studentScores.put("Ani", 2.0);

        // We can also just call it to update and ignore the return value
        studentScores.put("Helena", 2.2);

        double aniScore = studentScores.get("Ani");

        System.out.println("Whose score do you want to see?");
        Scanner input = new Scanner(System.in);
        String student = input.nextLine();

        System.out.println(student + "'s score is " + studentScores.get(student));
    }
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Stack / Stack

Special collection where we always put things on the end, and pull things off the end. 
(Think of a stack of plates.)

```java
import java.util.*;

public class Application {
    public static void Main(String[] args) {
        Stack<String> actions = new Stack<String>();

        actions.push("Added text");
        actions.push("Bolded text");
        actions.push("Colored text");

        while (actions.size() > 0) {
            String lastAction = actions.pop();
            System.out.println("Undoing action: " + lastAction);
        }
    }
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# LinkedList / Queue

Special collection where we always put things on the end, and pull things off the start.
(Think of a line - first come, first serve)

```java
import java.util.*;

public class Application {
    public static void Main(String[] args) {
        Queue<String> customers = new LinkedList<String>();
        customers.offer("Luke");
        customers.offer("Leia");
        customers.offer("Chewbacca");

        while (customers.size() > 0) {
            String currentCustomer = customers.poll();
            System.out.println("Now serving: " + currentCustomer);
        }
    }
}
```

---

![bg opacity:25%](images/bg-green-wave.jpg)
# Choosing a Collection Type

- Default to ArrayList 
- HashSet if the point is mostly to keep a list of things and check if something is in it later.
- HashMap if there is a key we want to associate with each item, and will retrieve things that way later.   
- Queue if we are keeping a list of things to do/process, and only care about next in line.
- Stack if we want to do that but do the latest thing first.

