# Genealogical Database Project

A comprehensive database system designed to manage and query genealogical relationships, implementing family tree structures with advanced SQL features including views, triggers, and complex queries.

## 🏗️ Project Overview

This project demonstrates advanced database design principles through a genealogical database that tracks family relationships including parents, children, grandparents, and grandchildren. The system includes data integrity constraints, automated validation through triggers, and comprehensive querying capabilities for family tree analysis.

## ✨ Features

- **Relational Database Design**: Well-structured tables for people and family relationships
- **Data Integrity**: Automatic validation through database triggers
- **Advanced Views**: Complex views for grandparent-grandchild relationships
- **Comprehensive Queries**: Multiple query scenarios covering various family relationship patterns
- **Constraint Validation**: Automatic checks for logical family relationships (e.g., birth date validation)
- **Sample Data**: Realistic family tree data for testing and demonstration

## 🗄️ Database Schema

### Core Tables

#### `Pessoas` (People)
- `id` - Primary key identifier
- `nome` - Person's name
- `sexo` - Gender ('f' for female, 'm' for male)
- `dataNasc` - Date of birth

#### `MaeDe` (Mother-Child Relationships)
- `mae` - Foreign key to mother's ID
- `filho` - Foreign key to child's ID (Primary key)

#### `PaiDe` (Father-Child Relationships)
- `pai` - Foreign key to father's ID
- `filho` - Foreign key to child's ID (Primary key)

### Views

#### `AvouDe` (Grandfather-Grandchild)
Shows grandfather-grandchild relationships through paternal and maternal lines.

#### `AvohDe` (Grandmother-Grandchild)
Shows grandmother-grandchild relationships through paternal and maternal lines.

#### `avo_e_N_Netos` (Grandparent-Grandchildren Count)
Counts the number of grandchildren for each grandparent.

## 🔧 Database Triggers

### Data Validation Triggers

1. **Gender Validation**: Ensures only males can be fathers and only females can be mothers
2. **Birth Date Validation**: Prevents logical inconsistencies where children are born before their parents

## 📊 Query Examples

The project includes several SQL query files demonstrating different family relationship scenarios:

- **`a.sql`**: Mother-child relationships
- **`b.sql`**: Grandparent-grandchild view creation
- **`c.sql`**: Complete grandparent-grandchild relationships
- **`d.sql`**: Full siblings (same mother and father)
- **`e.sql`**: Half-siblings (same mother or same father, but not both)
- **`f.sql`**: People with more than 3 children
- **`g.sql`**: Grandparent with the most grandchildren

## 🚀 Getting Started

### Prerequisites
- PostgreSQL database system
- SQL client or command line interface

### Installation

1. **Create Database Schema**:
   ```sql
   \i esquema.sql
   ```

2. **Load Sample Data**:
   ```sql
   \i dados.sql
   ```

3. **Execute Queries**:
   ```sql
   \i a.sql
   \i b.sql
   \i c.sql
   \i d.sql
   \i e.sql
   \i f.sql
   \i g.sql
   ```

## 📁 File Structure

```
├── esquema.sql      # Database schema and triggers
├── dados.sql        # Sample data insertion
├── a.sql           # Mother-child relationships query
├── b.sql           # Grandparent views creation
├── c.sql           # Grandparent-grandchild relationships
├── d.sql           # Full siblings query
├── e.sql           # Half-siblings query
├── f.sql           # Parents with >3 children
├── g.sql           # Grandparent with most grandchildren
└── README.md       # This file
```

## 🔍 Key Database Concepts Demonstrated

- **Referential Integrity**: Foreign key constraints maintaining data consistency
- **View Creation**: Complex views combining multiple tables
- **Trigger Functions**: Automated data validation and business rule enforcement
- **Advanced Joins**: Complex relationship queries using multiple table joins
- **Data Constraints**: CHECK constraints for data validation
- **Union Operations**: Combining results from multiple queries

## 🎯 Use Cases

This database system is ideal for:
- Family tree applications
- Genealogical research
- Educational purposes (database design and SQL)
- Demonstrating advanced database features
- Learning about data integrity and validation

## 🤝 Contributing

This is an academic project demonstrating database design principles. Feel free to use this as a reference for learning about:
- Relational database design
- SQL views and triggers
- Complex query writing
- Data integrity enforcement

## 📚 Learning Objectives

- Understanding normalized database design
- Implementing business rules through database constraints
- Creating complex views for data analysis
- Writing efficient SQL queries for relationship data
- Managing data integrity through triggers and constraints

## 📄 License

This project is created for educational purposes as part of a database course curriculum.

---

**Note**: This project demonstrates advanced database concepts and is suitable for students and developers looking to understand complex database design patterns and SQL implementations.
