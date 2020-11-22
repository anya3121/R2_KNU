Cтворити з’єдання з базою даних
```
conn <- dbConnect(RSQLite::SQLite(), "database.sqlite")
```
Необхідно створити фрейми даних:
1. Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті с типом виступу Spotlight. Сортування по назві статті.
```
res<-dbSendQuery(conn,"SELECT Title, EventType FROM Papers WHERE EventType='Spotlight' ORDER BY Title")
df<-dbFetch(res,n=10)
df
```
 Title EventType
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding Spotlight
2                                    Accelerated Mirror Descent in Continuous and Discrete Time Spotlight
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games Spotlight
4                                                                      Adaptive Online Learning Spotlight
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization Spotlight
6                                                 Attention-Based Models for Speech Recognition Spotlight
7                                                       Automatic Variational Inference in Stan Spotlight
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing Spotlight
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff Spotlight
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception Spotlight
```
2.Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.
```
res<-dbSendQuery(conn,"SELECT a.Name AS Author, p.Title FROM Authors a LEFT JOIN PaperAuthors p_a 
ON a.Id=p_a.AuthorId LEFT JOIN Papers p ON p.Id=p_a.PaperId WHERE a.Name = 'Josh Tenenbaum' ORDER BY p.Title")
df<-dbFetch(res,n=10)
df
```
```
          Author                                                                                             Title
1 Josh Tenenbaum                                                       Deep Convolutional Inverse Graphics Network
2 Josh Tenenbaum Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3 Josh Tenenbaum                                                Softstar: Heuristic-Guided Probabilistic Inference
4 Josh Tenenbaum                                                        Unsupervised Learning by Program Synthesis
```
