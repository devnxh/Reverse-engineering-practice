# Crackme2 Solution

## 🔍 Overview

This crackme validates user input using a two-step verification process:

1. Length check
2. Character-by-character comparison

---

## 🧪 Analysis

### Step 1: Input Handling

* The program takes user input using `gets`
* It calculates the length using `strlen`

---

### Step 2: Length Check

```asm
cmp [rbp+var_40], 0Bh
```

* `0Bh` = 11 (decimal)
* Input must be exactly **11 characters**

If the length is not equal to 11:
➡ Program jumps to failure branch

---

### Step 3: Character-by-Character Comparison (Core Logic)

After pasing the length check, the program enters a loop where each character is compared individually.

```asm
cmp dl, al
```

* `dl` → character from user input
* `al` → expected character (hardcoded or computed)

👉 The program compares **each character one by one**

* If characters match → continue loop
* If any character mismatches → program exits with failure

---

### Step 4: Reconstructing the Password

By stepping through the loop in the debugger:

* Observed expected characters stored in `al`
* Compared with input characters in `dl`
* Recovered the password **character-by-character**

---

## ✅ Final Password

```
P@$$W0RD!2S
```

---

## 🛠 Tools Used

* IDA Free

