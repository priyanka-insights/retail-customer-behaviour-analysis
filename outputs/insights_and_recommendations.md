# Retail Customer Behaviour Analysis
## Insights & Recommendations

Dataset: 3,900 customers | Total Revenue: $233,081 | Avg Order Value: $59.76

---

## INSIGHT 1 — Clothing Dominates Revenue But Creates Concentration Risk

**Finding:**
Clothing category generates $104,264 (44.7% of total revenue) with 1,737 
orders. Accessories contributes $74,200 (31.8%). Together they account for 
76.5% of total revenue across just 2 of 4 categories.

**So What:**
Heavy dependency on one category creates revenue concentration risk. 
If Clothing demand drops due to seasonality, competition, or trend shifts, 
44.7% of total revenue is immediately at risk. The business has no revenue 
buffer from other categories.

**Action:**
Launch category cross-sell campaigns targeting 1,737 Clothing buyers with 
Accessories recommendations. Use email or in-app messaging: "Customers who 
bought Clothing also viewed Accessories." Invest in Footwear and Outerwear 
product expansion to reduce single-category dependency.

**Estimated Impact:**
If 20% of Clothing buyers add one Accessories item at average $59.76:
1,737 × 20% × $59.76 = +$10,380 incremental revenue potential.

---

## INSIGHT 2 — Discounts Are Reducing AOV, Not Increasing It

**Finding:**
Discounted orders average $59.28 vs non-discounted orders at $60.13.
Discounts actively reduce Average Order Value by $0.85 per order.
1,677 orders had discounts applied — total margin erosion = $1,425.
Promo code analysis confirms identical impact — both tools reduce AOV equally.

**So What:**
The business is spending money on discounts that do not drive higher spend 
or higher order volume. This is a direct negative ROI on promotional spend. 
The standard assumption that discounts drive higher AOV is proven false in 
this dataset. Every discounted order costs the business $0.85 in margin 
with no compensating revenue benefit.

**Action:**
Immediately pause blanket discount strategy. Run a 30-day A/B test:
Group A receives discount as usual. Group B receives value-add offer 
(free shipping on orders above $75, or bundle deal). Measure AOV difference.
If AOV improves in Group B, permanently shift to value-add promotions.

**Estimated Impact:**
Eliminating unnecessary discounts on 1,677 orders recovers $1,425 in margin.
If free shipping threshold drives AOV from $59.76 to $65 — additional 
$5 × 3,900 orders = $19,500 potential revenue uplift annually.

---

## INSIGHT 3 — 51+ Age Group Is The Highest Value Demographic

**Finding:**
51+ customers: 1,476 customers (37.8% of base), $88,480 revenue (38% of total).
This is the highest revenue contribution of any age group.
36-50 group: $65,629 (28.2%) | 26-35: $44,342 | 18-25: $34,630.
Revenue advantage is volume-driven — avg spend is nearly equal across all groups.

**So What:**
The 51+ demographic is the single most valuable customer segment by revenue.
Most retail marketing skews toward younger demographics (18-35), leaving 
the highest-value segment underserved and under-targeted. This represents 
a significant competitive advantage if addressed proactively.

**Action:**
Create a dedicated premium loyalty program for 51+ customers. Include:
priority customer service, premium packaging, age-appropriate product 
curation, and early access to new collections. Target non-subscribed 51+ 
customers (estimated 1,073 based on 72.5% non-subscription rate among loyal) 
for subscription conversion with tailored messaging.

**Estimated Impact:**
Converting 10% of non-subscribed 51+ customers to subscribers:
1,073 × 10% = 107 new subscribers at $59.76 avg = +$6,394 annual revenue.

---

## INSIGHT 4 — 91.4% Loyal Customers But Only 2.1% New — Growth Ceiling Risk

**Finding:**
Loyal customers (5+ purchases): 3,563 (91.4% of base).
Returning customers (2-4 purchases): 254 (6.5%).
New customers (0-1 purchases): only 83 (2.1%).
The business has exceptional retention but near-zero new customer acquisition.

**So What:**
While retention is a genuine strength, a customer base of only 83 new 
customers means the business cannot grow organically. It is entirely 
dependent on existing customers continuing to purchase. Any disruption 
to loyal customer behaviour — economic downturn, competitor pricing, 
product dissatisfaction — creates immediate revenue risk with no new 
customer pipeline to compensate.

**Action:**
Launch a referral program immediately targeting the 3,563 loyal customers 
as brand ambassadors. Offer: "Refer a friend, both receive a reward."
Set a measurable acquisition KPI: double new customers from 83 to 166 
within next quarter. Track referral conversion separately from paid 
acquisition to measure program ROI.

**Estimated Impact:**
Referral programs typically convert at 3-5x higher rate than paid ads.
Even 50 additional new customers at $59.76 avg = +$2,988 incremental revenue.
If retained as loyal customers over 5+ purchases: 50 × $59.76 × 5 = 
+$14,940 lifetime value.

---

## INSIGHT 5 — Subscription Value Is Unclear — Messaging Needs Rethinking

**Finding:**
Subscribers: 1,053 customers (27% of base), avg spend $59.49.
Non-subscribers: 2,847 customers (73%), avg spend $59.87.
Subscribers actually spend $0.38 LESS per order than non-subscribers.
Of 3,563 loyal customers — 2,583 (72.5%) are NOT subscribed.

**So What:**
If subscribers do not spend more, the financial incentive to subscribe 
is unclear. The subscription benefit is likely operational — free shipping, 
priority access, convenience — not financial savings. This means current 
subscription messaging is probably targeting the wrong value proposition, 
showing "save money" when the real benefit is "save time and effort."
The 2,583 non-subscribed loyal customers represent the single largest 
untapped subscription growth opportunity in the dataset.

**Action:**
Survey existing subscribers: "What is the primary reason you subscribed?"
Redesign subscription messaging to highlight the actual benefit — likely 
convenience and priority access, not savings. Then run a targeted campaign 
to 2,583 non-subscribed loyal customers with corrected messaging.
Test two message variants: "Save money" vs "Never miss out — priority access."

**Estimated Impact:**
Improving subscription messaging could increase subscription rate from 
27% to 35%: 3,900 × 8% = 312 additional subscribers.
At $59.49 avg spend per subscriber order over multiple purchases, 
this represents significant long-term revenue retention improvement.

---

## LIMITATIONS

1. No date or time column — time-series analysis, cohort analysis, 
   Month-over-Month growth tracking not possible with this dataset.

2. No cost or margin data — all analysis is revenue-based. True 
   profitability per category or customer segment cannot be calculated.

3. No geographic granularity — location data exists but regional 
   demand patterns were not the focus of this analysis.

4. Dataset is synthetic — patterns and distributions may not fully 
   reflect real-world retail purchase behaviour.

---

## FUTURE SCOPE

1. Add transaction dates to enable cohort analysis and customer 
   churn prediction modelling.

2. Build a logistic regression model to predict subscription likelihood 
   based on purchase history and demographics.

3. Run a live A/B test — remove discounts for 30 days and measure 
   real AOV impact vs control group.

4. Integrate with web analytics data for full customer journey analysis 
   from acquisition to repeat purchase.