# Customer Exploratory Data Analysis (EDA)
In this project, I took on the challenge of uncovering insights from a [simulated customer dataset](https://github.com/mboss10/customer-EDA/blob/main/sources/Exploratory%20Data%20Analysis%20%5BCustomer%20Data%5D%20-%20Data.csv). Through a detailed Exploratory Data Analysis (EDA), I explored patterns, trends, and key metrics to transform raw data into actionable insights. Below, I share the methodology, findings, and takeaways from this analytical journey.  

## Methodology and tools used
To accomplish this project I decided to first start by **exploring** the data using my understanding of the [data definition file](https://github.com/mboss10/customer-EDA/blob/main/sources/Exploratory%20Data%20Analysis%20%5BCustomer%20Data%5D%20-%20Data%20Description.csv) provided and a couple of SQL queries. I loaded the data in a SQL client, **DBeaver**, and I started my exploration around 2 key facts that I identified: **Revenue, $** and **Usage, DBUs**.  

> [!NOTE]
> I have provided all the SQL queries I used in the [`EDA.sql`](https://github.com/mboss10/customer-EDA/blob/main/output%20files/EDA.sql) file.


The focus of my exploration queries revolved around **revenue per platform and per region, usage and revenue over time** as well as recent trend in **churn and new accounts**.
The results started to indicate several axis for further exploration:  
* A strong correlation between the type of platform and the revenue and usage
* A variability in the results based on the regions
* An uptick in new accounts and a reduction in churn through the most recent fiscal year

  
I then decided to **augment** this first set of exploration analysis with **visual representation**.  

I loaded the data into a **Jupyter notebook** and I used **pandas and plotly** libraries to create the **graphs** I needed to support the rest of my analysis.  

> [!NOTE]
> NB: I have provided the python code I wrote in the [`EDA.ipynb`](https://github.com/mboss10/customer-EDA/blob/main/output%20files/EDA.ipynb) file.

In the next paragraph, I will walk you through the results of my exploratory analysis in more details, using the queries I wrote and the graphs I plotted.

## Exploratory Analysis
### In-depth Insights from the Data

1. Platform and Revenue Correlation:

The data indicates that **Platform A** generally generates **higher revenue** (overall and on average) compared to Platform B. This trend is consistent across different fiscal year, regions and skuType.  

<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Platform_SKU.png" width="600px">
<br><br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Platform_Region.png" width="600px">
<br><br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Total%20Revenue%20by%20Platform.png">
<br><br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Total%20Revenue%20by%20Platform%20and%20skuType.png">
<br><br>

For example, entries associated with Platform A often show higher revenue figures than those associated with Platform B, suggesting that **Platform A** may have a more **robust customer base and/or higher usage rates**.  

This is confirmed by this visual analysis, in which we can quickly identified the **growing usage trajectory of Platform A** in contrast with the pretty **flat progress of Platform B**.  

<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Usage%20over%20time.png">
<br><br>

However, I created a query that shows that over time, the percentage of usage and revenue attributed to Platform A and Platform B is **slightly changing** towards Platform B.  
<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Month_usage.png">
<br><br>

Indeed Platform B contributed to **only 1% of the usage and revenue** in the month of **February 2018**, when in the most recent month we have in the dataset, **October 2020**, it contributed to **10% of the usage and 15% of the revenue**. I think it would be worth exploring further and monitoring the trend in the coming months.  


2. Regional Performance Variability:

There is noticeable **variability** in performance **across different regions**. The **Mid Market** regions, particularly MM and MM East, often show **lower usage and revenue figures** compared to the Commercial regions.

<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Total%20Revenue%20by%20Region.png">
<br><br>
<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Regions.png">
<br><br>

This could indicate that **Commercial regions have more engaged or higher-value customers**.  
<br><br>

3. Churn and New Accounts:

The data shows a **low churn rate** across the dataset, with most entries having a churned_quarter value of 0.  

<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Churn%20percentage%20per%20year.png">
<br><br>

However, there are some instances of **new accounts** being added, particularly in **recent fiscal quarters**, indicating potential growth areas. The presence of new accounts suggests that the **business is successfully acquiring new customers**, although the impact on overall revenue and usage needs further analysis.  

<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/FQ%20churn%20new%20account.png">
<br><br>
<br>
<img src="https://github.com/mboss10/customer-EDA/blob/main/images/Churn%20and%20New%20Accounts%20in%20FY2021.png">
<br><br>

## Assumptions on the Data  

I used the following assumptions to perform my analysis:
* The data is **complete** and **accurate** for the periods and metrics provided.
* Revenue and usage figures are directly **comparable across platforms and
regions**.
* The **fiscal quarters and years** align with the **company's reporting standards**.
* Churn and new account indicators are correctly labeled and **reflect actual
customer behavior**.

## Recommendations for the Business

**Focus on Platform A**  
Given the higher revenue associated with Platform A, the business should consider investing more in marketing and development for this platform to maximize returns.  

**Enhance Engagement in Commercial Regions**  
Since Commercial regions outperform Mid Market ones, targeted strategies to boost engagement and sales in Mid Market regions could help balance regional performance.  

**Monitor New Account Growth**  
With new accounts being added, especially in recent quarters, the business should focus on onboarding and nurturing these new customers to ensure long-term retention and revenue growth.  

## Additional Data Needed  

**Customer Segmentation Data**  
More detailed customer demographics and segmentation data could help tailor marketing and engagement strategies more effectively.  

**Competitive Analysis**  
Information on competitors' performance in similar regions and platforms could provide insights into market positioning and potential areas for improvement.  

**Customer Feedback**  
Qualitative data from customer feedback could help identify pain points and areas for product or service enhancements.  

## Executive Summary  

The analysis of the data reveals that **Platform A is a key driver of revenue**, suggesting a **strategic focus on this platform** could be beneficial. There is a significant **performance disparity** between **Commercial and Mid Market regions**, indicating **potential for growth** in the latter. The **low churn rate** coupled with the acquisition of **new accounts** presents an opportunity for **customer base expansion**. To capitalize on these insights, the business should consider enhancing its **focus on Platform A, improving engagement in underperforming regions, and leveraging new customer growth**. Additional data on customer segmentation, competitive landscape, and customer feedback would further inform strategic decisions.
