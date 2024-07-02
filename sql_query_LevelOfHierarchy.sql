WITH RECURSIVE RecursiveCategories AS (
  SELECT 
    category_id, 
    category_name, 
    parent_id, 
    0 AS уровень
  FROM categories
  WHERE parent_id IS NULL
  UNION ALL
  SELECT 
    c.category_id, 
    c.category_name, 
    c.parent_id, 
    rc.уровень + 1
  FROM categories c
  JOIN RecursiveCategories rc ON c.parent_id = rc.category_id
)
SELECT 
  rc.category_name,
  COALESCE(COUNT(c.category_id), 0) AS количество_дочерних_категорий
FROM RecursiveCategories rc
LEFT JOIN categories c ON rc.category_id = c.parent_id
GROUP BY rc.category_name
ORDER BY rc.category_name;