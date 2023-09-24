# 1. What is our repeat user rate?
<p> 79.83 or 80 </p>
<br>

# 2. What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
<p> For likely customers, it could be things such as a lot of page views or events such as adding to cart. It could also be that there was a short shipping time. For unlikely customers it would be the inverse. If I had more data, could potential add more demographic from surveys which could indicate what the ideal user profile looked like. </p>
<br>

# 3. Explain the product mart models you added. Why did you organize the models in the way you did?
<p> I added two models, one for page views and one for orders with products. I put the page views model together so we could track what events were tied to what products. For the orders with products table, I wanted to see all the orders details so what items, product, and promos were tied to the orders. I arranged them in the folders the way I did based on intermediate tables and marts for both product and core </p>
<br>

# 4. What assumptions are you making about each model? (i.e. why are you adding each test?)
<p>I didn't make many assumptions. I just joined some tables together that I thought would be common, therefore I really wanted to just make sure the primary keys were correct. Didn't really think of other tests needed.</p>
<br>

# 5. Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
<p> I did. I found that after joining orders to order_items, I had my unique test set for order_id, which failed after running it. I then added a new columns concat(product_id, order_id) as product_order_id to get a unique primary key.
<br>

# 6. Which products had their inventory change from week 1 to week 2?
<p> 4 products did. Pothos, Philodendron, Monstera, String of pearls</p>
