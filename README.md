# Mid-bootcamp-project
case study : regression

# House Price Prediction Project

## 1. Project Overview
This project aims to predict the selling prices of houses using machine learning techniques. The project also includes SQL queries for data extraction and Tableau dashboards for visualizing key insights. The goal is to help a real estate company understand the factors that influence house prices and build a predictive model to estimate the value of properties.

## 2. Project Structure
### SQL/Database:
+ SQL scripts for data extraction and transformation.
### Tableau:
+ Tableau dashboards for visualizing data trends and insights.
### Machine Learning:
+ Jupyter notebooks containing code for data preprocessing, model training, and evaluation.

## 3. Dataset Information
#### Source: Historic data of houses sold between May 2014 and May 2015.
#### Key Features:
+ id: Unique identification number.
+ date: Date when the house was sold.
+ price: Selling price of the house.
+ bedrooms: Number of bedrooms.
+ bathrooms: Number of bathrooms.
+ sqft_living: Square footage of the living area.
+ grade: Overall grade given to the housing unit.

## 4. SQL Queries
#### Overview: 
+ SQL scripts are used to extract and clean data before it is used for analysis or modeling.
#### Key Queries:
+ Data selection and filtering.
+ Aggregations to understand the distribution of prices.
+ Joins to combine different data sources.

## 5. Tableau Dashboards
#### Overview: 
+ Tableau is used to create visualizations that help in understanding the key drivers of house prices.
#### Key Dashboards:
+ Price distribution by location.
+ Correlation between square footage and price.
+ Impact of renovations on house value.

## 6. Machine Learning Process

#### 6.1. Data Preprocessing
##### Handling Missing Values:
+ All missing values were identified and handled, ensuring the dataset was complete for modeling.
##### Feature Engineering:
+ Created new features like year_sold.
+ Dropped irrelevant columns such as id and date.
+ Categorical variables like waterfront and condition were encoded using one-hot encoding.

#### 6.2. Exploratory Data Analysis (EDA)
##### Correlation Analysis: 
+ A heatmap was used to identify the features most correlated with house prices. Key correlations include:
+ sqft_living and price
+ grade and price
##### Pair Plots: Visualized relationships between features like sqft_living, grade, sqft_above, and price.

#### 6.3. Model Building
##### Models Used:
Linear Regression: Baseline model to predict house prices.
##### K-Nearest Neighbors (KNN): Non-linear model to capture complex relationships.
##### Decision Tree: Model to capture non-linear patterns and feature interactions.
##### Performance Metrics:
##### Mean Absolute Error (MAE): Average absolute difference between predicted and actual prices.
##### Mean Squared Error (MSE) & Root Mean Squared Error (RMSE): Measures the average squared difference and its square root.
##### R-Squared (R2): Proportion of variance in the dependent variable explained by the independent variables.

#### 6.4. Model Evaluation
+ Comparison of Models:
Linear Regression showed an R2 of ~0.69, indicating that it explains about 69% of the variance in house prices.
Decision Tree and KNN models were evaluated for performance but required careful tuning to avoid overfitting.
+ Final Model Selection: Based on R2, RMSE, and business interpretability, the best model was selected for deployment.

## 7. Business Insights
+ Factors Influencing House Prices:
+ Higher square footage and better grades significantly increase house prices.
+ Properties with waterfront views and recent renovations tend to sell at a premium.
+ Recommendations: Focus on improving property grades and marketing waterfront properties to maximize sales prices.

## 8. Future Work
+ Model Improvement: Explore ensemble methods like Random Forest or Gradient Boosting for better prediction accuracy.
+ Feature Expansion: Include more features like school district quality or proximity to amenities.
+ Deployment: Create a web app to allow real estate agents to predict house prices using the final model.

## 9. How to Use the Repository
+ SQL: Run the provided SQL scripts to extract and transform the data.
+ Tableau: Open the Tableau files to explore the dashboards and gain insights.
+ Machine Learning:
Run the Jupyter notebook to train the models and evaluate their performance.
The notebook includes code for data preprocessing, EDA, model training, and evaluation.








Cha
