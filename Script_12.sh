#!/bin/bash

# Intro information
echo "This is the Lab 10 Bash directory"

# Key entering guidance
echo "Please select the Number related to the menu area you want to access::"
echo "0 Exit"
echo "1 Project Introduction"
echo "2 File Integrity Check Helper"
echo "3 Dependency Check Helper"
echo "4 Credits"

# Read user input
read choice

# Handle user input
case $choice in
  0)
    echo "Exiting MyShellScript..."
    ;;
  1)
    echo "This is the introduction to the project."
    echo "Our project is a simple racing game that features 3 levels"
    echo "It allows the player to drive the car around different racetracks with different cars"
    echo "each level is designed differently, with the intent of using different assets and practice of the mechanics"
    echo "The game is programmed and made in Unity, and uses all free assets, made purely in the pursuit of education and practice ."
    ;;
  2)
    echo "This is the file integrity check helper."
    ;;
  3)
    echo "This is the dependency check helper."
    ;;
  4)
    echo "Credits:"
    echo "Chandler Bryant - cbryant126@csu.fullerton.edu"
    echo "Shawn Melwani - smelwani@csu.fullerton.edu"
    echo "Drake Nguyen - 18dnguyen@csu.fullerton.edu"
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
esac

