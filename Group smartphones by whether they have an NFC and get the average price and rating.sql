# Group smartphones by whether they have an NFC and get the average price and rating
SELECT has_nfc,
avg(price) as 'avg_price',
avg (rating) as 'avg rating'
FROM atul.smartphones
group by has_nfc