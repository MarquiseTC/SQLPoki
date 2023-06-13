--What grades are stored in the database?
--Select *
--From Grade

--What emotions may be associated with a poem?
--Select *
--from Emotion

--How many poems are in the database?
--Select 
--Count(*)
--from Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
--Select Distinct(Name)
--From Author
--Order By Name

--Starting with the above query, add the grade of each of the authors.
--Select Distinct(a.name), g.name
--from Author a
--join Grade g
--on g.Id = a.GradeId
--Order By g.Name


--Starting with the above query, add the recorded gender of each of the authors.
--Select Distinct(a.name) as Artist, g.name as grade, gn.Name as gender
--from Author a
--join Grade g
--on g.Id = a.GradeId
--join Gender gn
--on gn.Id = g.Id
--Order By a.Name


--What is the total number of words in all poems in the database?
--Select 
--Sum(WordCount)
--from Poem


--Which poem has the fewest characters?
--Select CharCount, Title
--from Poem
--Order By CharCount 


--How many authors are in the third grade?
--Select Count(*)
--from Author a
--join Grade g
--on g.Id = a.GradeId
--where g.id = 3



--How many total authors are in the first through third grades?
--Select Count(*)
--from Author a
--join Grade g
--on g.Id = a.GradeId
--Where g.Id in(1,2,3)



--What is the total number of poems written by fourth graders?
--Select Count(*)
--from Author a
--join Grade g
--on g.Id = a.GradeId
--join Poem p 
--on p.AuthorId = a.Id
--where a.GradeId = 4


--How many poems are there per grade?
--Select g.name,
--Count (p.Id) as totalPoems
--from Poem p
--join Author a
--on a.Id = p.AuthorId
--join Grade g
--on g.id = a.GradeId
--group by g.Name



--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--Select g.name,
--Count (a.Id) as TotalAuthors
--From
--Author a

--join Grade g
--on g.id = a.GradeId
--group by g.Name


--What is the title of the poem that has the most words?
--Select Title, WordCount 
--from Poem
--order by WordCount DESC

--Which author(s) have the most poems? (Remember authors can have the same name.)
--Select Count(*) as PoemCount, a.Name as ArtistName
--from Poem p
--Join Author a
--on p.AuthorId = a.Id
--group by a.Name
--Order by a.Name


--How many poems have an emotion of sadness?
--Select Count(*) as total, e.Name as Name
--from Poem p
--join PoemEmotion pe
--on pe.PoemId = p.Id
--join Emotion e 
--on e.id = pe.EmotionId
--where e.name = 'Sadness'
--group by e.Name
--order by Count(*)



--How many poems are not associated with any emotion?
--Select * 
--from Poem p
--left join PoemEmotion pe
--on p.id = pe.PoemId
--Where pe.EmotionId is null








--Which emotion is associated with the least number of poems?
--Select Count(*) as total, e.Name as Name
--from Poem p
--join PoemEmotion pe
--on pe.PoemId = p.Id
--join Emotion e 
--on e.id = pe.EmotionId
--group by e.Name
--order by Count(*)


--Which grade has the largest number of poems with an emotion of joy?
--Select Count(p.id) as total,  g.name as grade, e.Name as emotion
--from Grade g
--join Author a
--on g.id = a.GradeId
--join Poem p
--on p.AuthorId = a.id
--join PoemEmotion pe
--on pe.PoemId = p.Id
--join Emotion e 
--on e.id = pe.EmotionId
--where e.Name = 'Joy'
--group by g.Name, e.Name




--Which gender has the least number of poems with an emotion of fear?

Select Count(p.id) as total,  g.name as gender, e.Name as emotion
from Gender g
join Author a
on g.id = a.GenderId
join Poem p
on p.AuthorId = a.id
join PoemEmotion pe
on pe.PoemId = p.Id
join Emotion e 
on e.id = pe.EmotionId
where e.Name = 'Fear'
group by g.Name, e.Name
order by total DESC
