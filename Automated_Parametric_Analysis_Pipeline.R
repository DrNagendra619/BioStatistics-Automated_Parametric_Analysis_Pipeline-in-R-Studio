# ==============================================================================
# FILE NAME: Automated_Parametric_Analysis_Pipeline.R
# PURPOSE: Automated Parametric Statistical Testing & Visualization
# OUTPUT PATH: D:/DOWNLOADS
# ==============================================================================

# ------------------------------------------------------------------------------
# SETUP: Define Output Path & Logging
# ------------------------------------------------------------------------------
output_path <- "D:/DOWNLOADS"

# Check if directory exists, if not, create it
if(!dir.exists(output_path)){
  dir.create(output_path)
  message("Created directory: ", output_path)
}

# Set working directory
setwd(output_path)

# Start recording all console output to a text file
sink(file = "Parametric_Results_Log.txt", split = TRUE)

print(paste("Analysis started at:", Sys.time()))
print(paste("Script Name: Automated_Parametric_Analysis_Pipeline.R"))
print("Saving all outputs to D:/DOWNLOADS...")


# ------------------------------------------------------------------------------
# PART 1: Data Loading & Preparation
# ------------------------------------------------------------------------------
print("--- Loading Data ---")
# Load built-in dataset 
data(mtcars) 

# Convert 'am' variable to factor (0 = automatic, 1 = manual) 
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual")) 

# Save processed data for reference
write.csv(mtcars, "mtcars_parametric.csv")
print("Saved: mtcars_parametric.csv")


# ------------------------------------------------------------------------------
# PART 2: One-sample t-test
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("2. One-sample t-test")
print("H0: mean(mpg) = 20 | H1: mean(mpg) != 20")
print("------------------------------------------------")

# Run Test
print(t.test(mtcars$mpg, mu = 20))

# Visualization: Histogram with Mean vs Target
png(filename = "1_OneSample_Ttest_Hist.png", width=800, height=600)
hist(mtcars$mpg, col="skyblue", border="white",
     main="One-Sample t-test: Distribution of MPG",
     xlab="Miles Per Gallon (MPG)")
# Add line for Null Hypothesis (20)
abline(v=20, col="red", lwd=3, lty=2)
# Add line for Actual Mean
abline(v=mean(mtcars$mpg), col="blue", lwd=3)
legend("topright", legend=c("Null Hypothesis (20)", "Actual Mean"),
       col=c("red", "blue"), lty=c(2, 1), lwd=3)
dev.off()
print("Saved: 1_OneSample_Ttest_Hist.png")


# ------------------------------------------------------------------------------
# PART 3: Independent two-sample t-test
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("3. Independent two-sample t-test (MPG by Transmission)")
print("H0: Mean MPG (Auto) = Mean MPG (Manual)")
print("------------------------------------------------")

# Run Test
print(t.test(mpg ~ am, data = mtcars))

# Visualization: Boxplot
png(filename = "2_Independent_Ttest_Boxplot.png", width=800, height=600)
boxplot(mpg ~ am, data = mtcars, 
        col=c("orange", "lightgreen"),
        main="Independent t-test: MPG by Transmission",
        ylab="MPG", xlab="Transmission Type")
dev.off()
print("Saved: 2_Independent_Ttest_Boxplot.png")


# ------------------------------------------------------------------------------
# PART 4: Paired t-test
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("4. Paired t-test (Training Program)")
print("H0: Mean diff = 0 | H1: Mean diff != 0")
print("------------------------------------------------")

# Create Dataset
before <- c(72, 75, 78, 70, 69) 
after  <- c(68, 70, 72, 67, 66)

# Save Paired Data
paired_df <- data.frame(Before=before, After=after)
write.csv(paired_df, "paired_training_data.csv", row.names=FALSE)
print("Saved: paired_training_data.csv")

# Run Test
print(t.test(before, after, paired = TRUE))

# Visualization: Boxplot of Before vs After
png(filename = "3_Paired_Ttest_Boxplot.png", width=800, height=600)
boxplot(before, after, names=c("Before", "After"),
        col=c("salmon", "lightblue"),
        main="Paired t-test: Effect of Training Program",
        ylab="Weight")
dev.off()
print("Saved: 3_Paired_Ttest_Boxplot.png")


# ------------------------------------------------------------------------------
# PART 5: One-way ANOVA
# ------------------------------------------------------------------------------
print("------------------------------------------------")
print("5. One-way ANOVA (MPG by Cylinders)")
print("H0: Means are equal across groups")
print("------------------------------------------------")

# Run Test
anova_model <- aov(mpg ~ factor(cyl), data = mtcars) 
print(summary(anova_model))

# Visualization: Boxplot for ANOVA
png(filename = "4_ANOVA_Boxplot.png", width=800, height=600)
boxplot(mpg ~ factor(cyl), data = mtcars,
        col=c("gray90", "gray70", "gray50"),
        main="One-Way ANOVA: MPG by Cylinder Count",
        xlab="Number of Cylinders", ylab="MPG")
dev.off()
print("Saved: 4_ANOVA_Boxplot.png")


# ------------------------------------------------------------------------------
# TEARDOWN
# ------------------------------------------------------------------------------
# Stop logging
sink()
message("------------------------------------------------")
message("Analysis Complete.")
message("Please check D:/DOWNLOADS for:")
message("1. Parametric_Results_Log.txt")
message("2. CSV Data Files")
message("3. PNG Plots")
message("------------------------------------------------")

