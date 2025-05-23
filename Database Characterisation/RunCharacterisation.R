
outputFolder <-  here::here("Results")


result <- OmopSketch::databaseCharacteristics(cdm,
                                  sex = sex,
                                  ageGroup = ageGroup,
                                  dateRange = dateRange,
                                  interval = interval,
                                  conceptIdCount = conceptCounts,
                                  )
omopgenerics::exportSummarisedResult(result, minCellCount = minCellCount, fileName = "result_characterisation_{cdm_name}.csv", path = outputFolder)
