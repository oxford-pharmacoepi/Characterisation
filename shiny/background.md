# Characterisation

This Shiny app presents the results of a characterisation done with the R package `OmopSketch` conducted on the database Synthea.

The analyses include:

-   A `snapshot` of the CDM containing general info like person count and vocabulary version.

-   Characterisation of the `clinical tables`

    -   `Missing data`: counts of missing data points.

    -   `Record count`: counts of records in observation within the OMOP tables.

    -   `Clinical records`: distribution of records per person in the OMOP tables.

    -   `Concept_id counts`: numbers of records and subjects for each concept.

-   Characterisation of the `observation period` table, stratified by age, sex:

    -   `In observation`: annual trend in number of person-days, records, subjects, females, and in median age in observation in the study period.

    -   `Observation periods`: distribution of observation durations (in days) and days to the next observation for each ordinal observation period.
