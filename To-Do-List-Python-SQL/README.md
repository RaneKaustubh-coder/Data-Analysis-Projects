# To-Do List Application (Python, MySQL)

CLI-based To-Do List application with full CRUD operations and persistent MySQL storage using Python and mysql-connector

## Overview
A command-line To-Do List application with persistent MySQL storage, 
implementing full CRUD operations with multi-layer exception handling.

## Features
- Add new tasks
- View all tasks with completion status
- Update task status (complete/incomplete)
- Delete tasks by ID
- Persistent storage across sessions using MySQL

## Technical Highlights
- Parameterized SQL queries to prevent SQL injection
- cursor.rowcount validation to detect operations on non-existent task IDs
- Multi-layer exception handling — separating ValueError, 
  mysql.connector.Error, and generic exceptions
- finally block ensures clean connection closure regardless of runtime errors
- if __name__ == '__main__' guard for clean entry-point execution

## Tools Used
Python, MySQL, mysql-connector-python

## Files
- To-Do-List.py — Main application file
