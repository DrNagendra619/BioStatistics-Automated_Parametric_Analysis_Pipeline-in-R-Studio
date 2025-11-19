# BioStatistics-Automated_Parametric_Analysis_Pipeline-in-R-Studio
BioStatistics = Automated_Parametric_Analysis_Pipeline in R Studio
# 🧪 Automated Parametric Statistical Analysis Pipeline (R)

This R script automates a pipeline for performing four of the most common parametric statistical tests: **One-sample t-test**, **Independent two-sample t-test**, **Paired t-test**, and **One-way ANOVA**. It uses both the built-in `mtcars` dataset and a simulated dataset for the paired analysis.

The pipeline ensures that for every test, the calculated results and corresponding visualizations are automatically saved, providing a comprehensive and reproducible analysis.

## 🚀 Key Features

* **Four Core Parametric Tests:** Includes structured sections for $t$-tests (one-sample, independent, paired) and ANOVA.
* **Hypothesis Testing:** Clearly states the Null and Alternative Hypotheses for each statistical test.
* **Automated Visualization:** Generates relevant PNG plots (Histograms and Boxplots) to visualize the data supporting each test result.
* **Data Preparation:** Demonstrates necessary data transformation, such as converting the `am` (transmission) variable to a factor for group comparison.
* **Complete Logging:** All statistical output, test results, and file save locations are automatically recorded in a log file for review and reproducibility.

## 📁 Output Structure

All generated files are saved to the defined `output_path` (default: `D:/DOWNLOADS`).

| Filename | Type | Description |
| :--- | :--- | :--- |
| `Parametric_Results_Log.txt` | Text Log | Comprehensive log of the script's execution, including the full output of all $t$-tests and the ANOVA summary. |
| `mtcars_parametric.csv` | CSV | The processed `mtcars` data used for analysis (with the `am` variable factored). |
| `paired_training_data.csv` | CSV | The simulated 'before' and 'after' data used for the Paired $t$-test example. |
| `1_OneSample_Ttest_Hist.png` | PNG Image | Histogram of MPG, visualizing the actual mean against the null hypothesis value ($\mu=20$). |
| `2_Independent_Ttest_Boxplot.png` | PNG Image | Boxplot comparing MPG for Automatic vs. Manual transmission. |
| `3_Paired_Ttest_Boxplot.png` | PNG Image | Boxplot comparing the simulated 'Before' vs. 'After' weight data. |
| `4_ANOVA_Boxplot.png` | PNG Image | Boxplot comparing MPG means across different levels of Cylinder count (`cyl`). |

## ⚙️ How to Run the Script

1.  **Download** the `Automated_Parametric_Analysis_Pipeline.R` file.
2.  **Optional:** Modify the `output_path` variable at the beginning of the script to your desired saving location.
    ```R
    output_path <- "D:/DOWNLOADS" # Change this path
    ```
3.  **Execute** the script in your R environment (RStudio or R console):
    ```R
    source("Automated_Parametric_Analysis_Pipeline.R")
    ```
4.  **Check** the specified output directory for the log file, data, and four visualization images.

## 🔬 Statistical Tests Overview

| Part | Test Performed | Variables | Null Hypothesis ($\text{H}_0$) |
| :--- | :--- | :--- | :--- |
| **Part 2** | One-sample $t$-test | `mpg` | The population mean of MPG is equal to 20. |
| **Part 3** | Independent $t$-test | `mpg` vs. `am` (Transmission) | The mean MPG for Automatic cars is equal to the mean MPG for Manual cars. |
| **Part 4** | Paired $t$-test | `before` vs. `after` (Simulated Data) | The mean difference between the 'before' and 'after' measurements is zero. |
| **Part 5** | One-way ANOVA | `mpg` vs. `cyl` (Cylinders) | The mean MPG is equal across all cylinder groups (4, 6, and 8). |

---
*Created by the Automated Parametric Analysis Pipeline using R.*
