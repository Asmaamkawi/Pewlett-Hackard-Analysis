
--The Number of Retiring Employees by Title:
select e.emp_no,e.first_name, e.last_name,t.title, t.from_date,t.to_date
INTO retirement_titles
from employees as e
INNER JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date between '1952-01-01' AND '1955-01-01')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;


--the number of retirement-age employees by most recent job title.
select count(ut.emp_no), ut.title
into retiring_titles
from unique_titles as ut
GROUP BY TITLE
ORDER BY COUNT(title) DESC;

--mentorship_eligibilty:

select distinct on( e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
--INTO mentership_eligibilty
from employees as e
inner join dept_emp as de
on (e.emp_no=de.emp_no)
inner join titles as t
on (e.emp_no=t.emp_no)
Where (e.birth_date Between '1962-01-01' and '1965-12-31')
and (de.to_date='9999-01-01')
order by emp_no


