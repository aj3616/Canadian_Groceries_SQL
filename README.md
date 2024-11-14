# Canadian Grocery Data Analysis

## Overview

This repository provides a foundation for analyzing Canadian grocery pricing and vendor data. The project focuses on understanding vendor pricing patterns and brand representation across various grocery products in Canada. A key focus of the analysis is identifying whether there is a vendor that consistently offers the cheapest essential product: bread. Students can adapt and expand this structure for their own data analysis projects.

## File Structure

The repository is structured as follows:

-   `data/raw_data` contains the raw data, including vendor and pricing information in csv. Data was cleaned using D Browser for sqlite , however, the sqlite file was too large to be uploaded, so two csv files contained the same data was uploaded
-   `data/analysis_data` contains cleaned datasets prepared for analysis.
-   `other` contains additional materials such as relevant literature, exploratory notes, and sketches.
-   `paper` contains files for generating the final report, including Quarto documents, reference bibliographies, and PDFs of the analysis paper.
-   `scripts` contains R scripts for data simulation, cleaning, and analysis.

## Statement on LLM Usage

Aspects of the code and the writings were developed with the assistance of ChatGPT4o. Including developing test cases, checking SQL syntax, and writing grammar polishments.

All interactions and generated content have been documented in `other/llm_usage/usage.txt`.


## Purpose

This repository is designed to enable the exploration of pricing differences among Canadian grocery vendors and the representation of popular brands in the market. The analysis heavily relies on SQL for querying and analyzing data, particularly to identify pricing trends. The primary research question investigates whether a specific vendor offers the cheapest price for essential products like bread. The insights derived can inform consumer choices and contribute to broader discussions on pricing fairness and market trends in the Canadian grocery industry.
