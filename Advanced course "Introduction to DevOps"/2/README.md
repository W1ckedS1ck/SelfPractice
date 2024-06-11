# 2.1: Bash. Writing scripts in Linux

What is BASH?  
Bash (Bourne Again SHell) is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell (sh). It is widely used as the default shell on Linux and macOS systems. Bash combines features of both the Bourne shell and the C shell, providing a powerful and flexible environment for command execution, scripting, and automation.  
## Here are some key features and characteristics of Bash:  
1. **Command Execution**:  
   Bash allows users to execute commands by typing them into the terminal. These commands can be simple utilities, complex pipelines, or scripts.
3. **Scripting**:  
   Bash supports scripting, enabling users to write scripts to automate repetitive tasks, manage system configurations, and perform complex operations.
2. **Variables**:  
   Bash supports the use of variables to store data, which can be used and manipulated within scripts and commands.
2. **Control Structures**:  
   Bash provides control structures such as loops (for, while), conditionals (if, case), and functions, which allow for more complex and conditional execution of commands.
2. **Job Control**:
   Bash supports job control, allowing users to manage background and foreground processes, suspend and resume jobs, and handle process signals.
2. **Command History**:  
   Bash maintains a history of executed commands, enabling users to recall, edit, and re-execute previous commands.
2. **Aliases and Functions**:  
   Users can create aliases and functions to simplify complex commands or create custom commands.
2. **Redirection and Pipelines**:
   Bash allows input and output redirection (using >, <, >>, <<) and pipelines (using |) to connect commands and manipulate data streams.
2. **Environment Customization**:
   Bash allows extensive customization of the environment through configuration files like .bashrc, .bash_profile, and .bash_logout.
2. **Tab Completion**:
   Bash provides tab completion to help users quickly complete file names, commands, and variables, enhancing productivity.

## Example of a Simple Bash Script:
 ```bash
#!/bin/bash
# This is a simple Bash script
echo "Hello, World!"
# Define a variable
name="Alice"
# Use the variable
echo "Hello, $name!"
# A simple for loop
for i in {1..5}
do
   echo "Loop iteration $i"
done
# A simple function
greet() {
    echo "Hello, $1!"
}
# Call the function
greet "Bob"
```
## Common Use Cases for Bash:
1. **System Administration**: Automating system maintenance tasks, managing files, and configuring servers.
2. **Development**: Compiling code, running tests, and deploying applications.
3. **Data Processing**: Manipulating and analyzing text files and data streams.
4. **Networking**: Managing network configurations and automating network tasks.
5. **Scripting Utilities**: Creating custom command-line tools and utilities.

## Here are examples of loops in Bash:
1. for Loop  
 ```bash
#!/bin/bash
# Simple for loop example
for i in {1..5}
do
    echo "Iteration $i"
done
 ```
2. while Loop  
 ```bash
#!/bin/bash
# Simple while loop example
counter=0
while [ $counter -lt 5 ]
do
    echo "Counter is $counter"
    ((counter++))
done
 ```
3. until Loop  
 ```bash
#!/bin/bash

# Simple until loop example
counter=0
until [ $counter -ge 5 ]
do
    echo "Counter is $counter"
    ((counter++))
done
 ```
