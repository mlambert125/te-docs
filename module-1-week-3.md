---
mmarp: true
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

OR

```java
// Just go get everything in utils.
import java.util.*;
```

---
