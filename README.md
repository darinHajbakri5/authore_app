# Author Explorer App

## Overview
This application allows users to search for authors and explore detailed information about their lives and works using the Open Library API.

## Features
- **Search Authors**: Enter an author's name to find them and see basic details, including their most notable works.
- **View Author Works**: Click on an author to see a list of their publications, with options for pagination.

## Technical Stack
- **Flutter & Dart**: For building the user interface and handling backend logic.
- **Bloc/Cubit**: Manages state changes and business logic.
- **Dio**: Used for making HTTP requests.
- **Equatable**: Helps in comparing state objects for Bloc.

## Structure
- **AuthorSearchPage**: Where users search for authors.
- **AuthorWorksPage**: Displays a detailed list of an author's works.

## Goals
Provide a user-friendly tool for exploring author biographies and bibliographies.

## Installation

Clone the repository:
```bash
git clone https://github.com/darinHajbakri5/authore_app.git
cd authore_app
