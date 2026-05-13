# Number Guessing Game (Python)

Multi-difficulty CLI guessing game built in Python with dual-layer input validation and play-again functionality

## Overview
A multi-difficulty command-line guessing game with input validation,
fixed attempt system, and play-again functionality.

## Difficulty Levels
- Easy: 1–50
- Normal: 1–100  
- Hard: 1–200

## Technical Highlights
- Dual-layer input validation — custom ValueError for invalid difficulty,
  separate ValueError for non-integer guesses without penalizing attempt count
- Fixed 3-chance attempt system with remaining chances display
- Play-again loop with clean exit
- if __name__ == '__main__' guard for Python module best practices

## Tools Used
Python

## Files
- Guessing_Game.py — Main application file
**Number Guessing Game** ![Number-Guessing-Game](Guessing_Game.py)
