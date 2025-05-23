# shiny is prepared to work with this resultList, please do not change them
resultList <- list(
  "summarise_omop_snapshot",
  "summarise_characteristics",
  "summarise_missing_data",
  "summarise_concept_id_counts" ,
  "summarise_clinical_records" ,
  "summarise_record_count" ,
  "summarise_in_observation" ,
  "summarise_observation_period"
)

source(file.path(getwd(), "functions.R"))

data_path <- file.path(getwd(), "data")
csv_files <- list.files(data_path, pattern = "\\.csv$", full.names = TRUE)
result <- purrr::map(csv_files, \(x){
  d <- omopgenerics::importSummarisedResult(x)
  d
}) |> 
  dplyr::bind_rows() |>
  omopgenerics::newSummarisedResult()

resultList <- resultList |>
  purrr::map(\(x) {
    omopgenerics::settings(result) |>
      dplyr::filter(.data$result_type %in% .env$x) |>
      dplyr::pull(.data$result_id) }) |>
  rlang::set_names(resultList)
# result <- omopgenerics::importSummarisedResult(file.path(getwd(), "data"))

data <- prepareResult(result, resultList)

filterValues <- defaultFilterValues(result, resultList)
filterValues$summarise_concept_id_counts_variable_name <- NULL
save(data, filterValues, file = file.path(getwd(), "data", "shinyData.RData"))

rm(result, filterValues, resultList, data)
