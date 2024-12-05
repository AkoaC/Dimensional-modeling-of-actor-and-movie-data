# Dimensional-modeling-of-actor-and-movie-data

This project illustrates the implementation of complete dimensional modelling, incorporating advanced concepts such as performance classification, historical data tracking and management of slowly evolving dimensions (SCD Type 2). Designed for the storage and analysis of complex data relating to players and their films, this project is based on a set of SQL scripts carefully architected to guarantee the robustness and flexibility of the data systems.

<h2> Aim of the project </h2>


Transform and organise the raw data from an actor_films dataset into a well-defined SQL structure, optimised for analysis.
Classify actor performance according to the quality of the associated films.
Track historical changes in the data using slow-changing dimension management (SCD Type 2).
Provide a robust, reusable database for decision-support analyses of actor and film performance.

<h2> Description of the steps </h2>

1. Creating custom SQL types

![image](https://github.com/user-attachments/assets/6e1cb465-5be7-4e28-bc33-d58d88a89d3c)


Purpose:

quality_class: Defines a classification of actors' performances based on film ratings.
actors: A composite type representing a movie and its properties, used to store movies in an easily manipulated structure.

2. Creating the main film table


![image](https://github.com/user-attachments/assets/b3c92de9-4f5e-4f43-bd38-03f26b93fd2d)

Purpose:

To store data on actors, their films and their performances in a structured format.
Key columns:
actors: Contains the list of films associated with each actor.
quality_class: Performance class derived from ratings.
is_active: Indicates whether the actor is active in the film industry.
year: Reference year for the activity.

3. Inserting data in films

![image](https://github.com/user-attachments/assets/29c7f5b0-812a-4c19-ad2f-57d681994c2b)


Transformation of source data to :
- Calculate the performance classification (quality_class).
- Group the films in a table by actor.
- Determine whether the actor is active (is_active).
- Insert into films while avoiding duplication with ON CONFLICT.

4. Create the actors_history_scd table

![image](https://github.com/user-attachments/assets/50291cef-64f2-4633-8bda-623a831cc4d8)

Purpose:

To track the evolution of player data and their performance over time.
The start_date and end_date columns define the data validity periods, implementing a SCD Type 2 model.

5. Inserting data into actors_history_scd


![image](https://github.com/user-attachments/assets/91327969-351e-4c51-a9ed-a8af401c8521)


Details :

Data retrieval from films.
Aggregation of periods (start_date, end_date) for each actor.
Insertion of data in actors_history_scd to enable historical tracking of performances.

#Impact of the project

1 - Robust and scalable modelling:
 
  - The films table structures the data for current analyses.
  - The actors_history_scd table provides a complete performance history, essential for retrospective analysis.


2 - Precise classification:

  - Quality classes (quality_class) allow clear segmentation of players.
  
3 - Automation and flexibility :
  - SQL scripts make it easy to integrate new data sets.
  - The model can be extended to include other metrics or dimensions.
