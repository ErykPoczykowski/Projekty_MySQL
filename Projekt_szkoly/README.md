# Komendy użyte w projekcie bazy danych:

1. CREATE DATABASE {IF NOT EXISTS} nazwa - stworzenie bazy danych.
   
     * IF NOT EXISTS - sprawdzanie czy już istnieje.
3. USE nazwa - użycie bazy danych.
4. CREATE TABLE {IF NOT EXISTS} 'nazwa' (column_name data_type parameters, ..., keys) - stworzenie tabeli.

     * column_name - nazwa kolumny.
     * data_type - typ danych (INT, VARCHAR(50), DATE, etc).
     * parameters (NULL, AUTO_INCREMENT, etc).
     * keys - klucze obce oraz podstawowe.
     * IF NOT EXISTS - sprawdzanie czy już istnieje.
   
## Klucz Podstawowy
PRIMARY KEY ('kolumna')

## Klucz obcy
CONSTRAINT 'nazwa_klucza' FOREIGN KEY ('kolumna_na_której_powstanie_klucz') REFERENCES 'tabela_do_której_się_odnosimy' ('kolumna'),
  
