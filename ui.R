
if (!require("shiny")) { install.packages("shiny", dependencies = TRUE) ; library(shiny)}
if (!require("shinyjs")) { install.packages("shinyjs", dependencies = TRUE) ; library(shinyjs)}
if (!require("shinyWidgets")) { install.packages("shinyWidgets", dependencies = TRUE) ; library(shinyWidgets)}
if (!require("shinythemes")) { install.packages("shinythemes", dependencies = TRUE) ; library(shinythemes)}
if (!require("shinydashboard")) { install.packages("shinydashboard", dependencies = TRUE) ; library(shinydashboard)}
if (!require("DT")) { install.packages("DT", dependencies = TRUE) ; library(DT)}
if (!require("data.table")) { install.packages("data.table", dependencies = TRUE) ; library(data.table)}
if (!require("png")) { install.packages("png", dependencies = TRUE) ; library(png)}


ui <- 
dashboardPage(     skin = "blue", # theme = shinytheme("cosmo"),
  dashboardHeader(
    #style = "position:fixed;", # inherit, width:12%;
    title = tags$a(href="https://github.com/KaranKakouei/KaranHub/", icon("github"), "KaranHub", style = "color: white; font-size: 24px;"),
    tags$li(a(href = 'https://github.com/KaranKakouei/KaranHub/', icon("github"), title = "Back to Apps Hub"), class = "dropdown", style = "size: 20px;margin-right:10px;")),
  dashboardSidebar(
    #tags$style(HTML(".main-sidebar{width: 250px;}")),
#    tags$head(tags$style(HTML('.main-sidebar{width: 300px;}.main-header>.navbar{margin-left: 300px;}.main-header.logo{width: 300px;}.content-wrapper, .main-footer, .right-side{margin-left: 300px;}'))),
    sidebarMenu(
      style = "position:fixed; width:14%;", # inherit
      menuItem("Home", tabName = "Home", icon = icon("home")),
#      menuItem("RFs in R", tabName = "Scripts_RFsR", icon = icon("code")),
      menuItem("Appliance energy predictions", tabName = "Scripts", icon = icon("code"),
          menuSubItem(" Data cleansing", tabName = "Scripts_Data_Cleansing", icon = icon("code")),
          menuSubItem(" Machine Learning", tabName = "Scripts_AllAlgorithmsR", icon = icon("r-project")),
          menuSubItem(" Machine Learning", tabName = "Scripts_AllAlgorithmsPy", icon = icon("python")),
          menuSubItem(" Visualization", tabName = "Visualization", icon = icon("chart-line")),
          menuSubItem(" Deep Learning", tabName = "Scripts_ANNsPy", icon = icon("python")))
  )),
  dashboardBody(
    tags$script(HTML("$('body').addClass('fixed');")),
    tabItems(
      tabItem("Home",
        fluidRow(
          column(width = 1),
          column(width = 10, 
          p("About me", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("For the last seven years, I have been working at the Leibniz-Institute of Freshwater Ecology and Inland Fisheries whereI have been 
          responsible for analysis of big data using machine/deep learning tools to assess predictive power of featureparameters or influencing 
          factors and define the potential scopes with implications for environmental management.I have also been responsible for contributing 
          to talking about data and thriving on explaining the meaning of databy providing easily interpretable outcomes (e.g., interactive dashboards, 
          reports and deliverables) for either my fellowcolleagues or scientists, managers, policymakers and non-technical stakeholders. During my 
          education and scientific life,I have developed a strong background in programming that has served me well in my pursuit to advance the 
          interestsof my employers. I am highly experienced in the management, cleaning and analysis of large data sets. With more thanseven years 
          of R and two years of Python programming, and two years of shell scripting experience, I see myself as adata scientist who extremely enjoys 
          preparing complex scripts to perform analytical modelling of big data, and effectivelyvisualising multi-dimensional data.", style= "text-align: justify; font-size: 18px;"),
          p("I have the initiative, enthusiasm and willingness to learn new skills and keep abreast of and promote new developmentsin the appropriate 
          professional field. Thanks to my migration background and my experience of studying and workingin different countries (Iran, The Netherlands 
          and Germany) I have become very flexible and able to adapt to differentworking environments while communicating in different languages, which 
          I really enjoy.", style= "text-align: justify; font-size: 18px;"),
          p("Data", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("Appliances energy prediction", style = "font-size: 20px; ; font-style: italic; font-weight:bold;"),
          p("Appliances energy use is recorded at 10-minute frequencies for roughly 4.5 months. The house temperature and humidity conditions were monitored with a ZigBee wireless sensor network. 
          Each wireless node transmitted the temperature and humidity conditions around 3.3 min. Then, the wireless data was averaged for 10 minutes periods. 
          The energy data was logged every 10 minutes with m-bus energy meters. Weather from the nearest airport weather station (Chievres Airport, Belgium) 
          was downloaded from a public data set from Reliable Prognosis (rp5.ru), and merged together with the experimental data sets using the date and time column. 
          Two random variables have been included in the data set for testing the regression models and to filter out non predictive attributes (parameters). You can download the data ", tags$a(href="https://www.kaggle.com/loveall/appliances-energy-prediction", "here on Kaggle."), style= "text-align: justify; font-size: 18px;"),
          p("R and Python scripts", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("If you are interested in the codes presented in this shiny app, please download thescripts under my ", tags$a(href="https://github.com/KaranKakouei/KaranHub/", "GitHub repository."), style= "text-align: justify; font-size: 18px;")
          )), column(width = 2)
      ),
      tabItem("Scripts_Data_Cleansing",
        # Output: Tabset w/ plot, summary, and table ----
        tabsetPanel(type = "tabs",
                    tabPanel("R",
                      fluidRow(
                        column(width = 1),
                        column(width = 10,
                        p("Data cleansing in R", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),

                        p("Here I clean the experimental dataset to prepare it for creating regression models of appliances energy use in a low energy building.", style = "text-align: justify; font-size: 18px;"),
                        p("Load all necessary R libraries:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_1", placeholder = TRUE),

                        p("Load your data set", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_2", placeholder = TRUE),

                        p("First overview of the data. We first take a look at the dimentions of our dataframe to get information on the potential number of feature parameters and observations' length", style = "text-align: justify; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_3", placeholder = TRUE),

                        p("The dataframe has 19735 rows, which means enough data is available for for our ML algorithms. 
                        So we have 29 columns, which include a date, a response (Appliances), and 27 feature parameters. 
                        Now we alphabetically sort the columns and check data structure.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_4", placeholder = TRUE),

                        p("Data structure shows that date and some of our feature parameters are loaded as character, which prevent us to describe summary of the data such as mean value of feature parameters. 
                        So we convert the date into date format and all feature variables to integers.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_5", placeholder = TRUE),

                        p("If we check the data structures we can see that all columns are in the correct format now.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_6", placeholder = TRUE),

                        p("Now we check whether each column includes incomplete values or NULLs, 
                        and find potential dulicates or the number of NAs per column. We then get the summary of each column for a more detailed overview of values per feature parameter.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_7", placeholder = TRUE),

                        p("So there is no NULLs, missing values, or duplicates in the dataframe!", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        p("", style = "font-size: 18px;"),
                        p("Feature parameters", style = "text-align: justify; font-size: 20px; font-weight:bold;"),
                        p("The number of feature parameters is rather large for such a dataset, so we should reduce them to prevent overfitting in our regression models.
                        First we can check for correlation between our features, and visualize data as a heatmap.", style = "ptext-align: justify; adding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_8", placeholder = TRUE),
                        tags$img(src = "DC_R_Heatmap.png", width = "30%"),
                        # here put the heatmap

                        p("A couple of feature parameters are highly co-correlated (|r| > 0.9). Examples are: T6 vs. T_out, T9 vs. T3/T5/T7, RH3 vs. RH4.
                        Either of these feature parameters can equally explain the variability in the response variable (i.e., Appliances), 
                        but we need to decide wich one to remove. We further visualizea the co-corelated feature parameters to confirm and deal with them. In this figure, 
                        we can see most of those features are highly co-correlated and show a very similar trend and a high variety of values.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_9", placeholder = TRUE),
                        tags$img(src = "DC_R_correlation_lines.png", width = "30%"),
                        # here put the correlation plots

                        p("Beyond the cocorrelated feature parameters, some of these parameters are relatively unimportant for appliances, so can be removed from the data set prior to regression modelling. 
                        To select which variables are unimpotant and deserve to be removed from the dataframe, we can run a random forest with 100 trees 
                        and assess the relative influence of all feature parameters on Appliances.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_10", placeholder = TRUE),
                        tags$img(src = "DC_R_VarImp.png", width = "30%"),
                        # here put the relative influence plot

                        p("The co-correlated parameters with least relative influence can also be removed from the data set. These parameters are: T_out, T7, and RH4.
                        Furthermore, least important feature parameters such as the two random variables of 'rv1' and 'rv2', and the 'Visibility' can also be removed from the data set.
                        'Lights' has also lots of null values which can be removed too. After removing these variables we come up with a total number of 21 feature parameters", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_11", placeholder = TRUE),

                        p("Now we check the distribution of the appliances and all features", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_12", placeholder = TRUE),
                        tags$img(src = "DC_R_Histogram.png", width = "30%"),
                        # here put the histogram (distribution plot)
                        p("We can see that all the columns follow normal distribution except T9, RH_6, and wind speed. The appliances is also left-skewed", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),

                        p("As the data was recorded at different times of the day or days of a week, and energy consumption (i.e. appliances) 
                        might depend on these parameters such as weekdays versus weekends or noon versus evenings, we can add 
                        (1) julian date to account for potential seasonality in data, and
                        (2) day of the week and hour of the day to account for time variability in energy consumption 
                        You can pull out individual parts of the date with the accessor functions yday() (day of the year), wday() (day of the week), hour(). 
                        Before fitting our selected features to the models, we need to normalize our feature parameters. 
                        Data normalization (here min-max scaling) enables us the opportunity to assess their relative 
                        influences on appliances without s judged by their relatively small or large values", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCR_13", placeholder = TRUE),
                        
                        p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
                        p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

                        )), column(width = 2)
                    ),
                    tabPanel("Python",
                      fluidRow(
                        column(width = 1),
                        column(width = 10,
                        p("Data cleansing in Python", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),

                        p("Here I clean the experimental dataset to prepare it for creating regression models of appliances energy use in a low energy building.", style = "text-align: justify; font-size: 18px;"),
                        p("Load all necessary Python libraries:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_1", placeholder = TRUE),

                        p("Load your data set", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_2", placeholder = TRUE),

                        p("First overview of the data. We first take a look at the dimentions of our dataframe to get information on the potential number of feature parameters and observations' length", style = "text-align: justify; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_3", placeholder = TRUE),

                        p("The dataframe has 19735 rows, which means enough data is available for for our ML algorithms. 
                        So we have 29 columns, which include a date, a response (Appliances), and 27 feature parameters. 
                        Now we alphabetically sort the columns and check data structure.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_4", placeholder = TRUE),

                        p("Data structure shows that date and some of our feature parameters are loaded as character, which prevent us to describe summary of the data such as mean value of feature parameters. 
                        So we convert the date into date format and all feature variables to integers.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_5", placeholder = TRUE),

                        p("If we check the data structures we can see that all columns are in the correct format now.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_6", placeholder = TRUE),

                        p("Now we check whether each column includes incomplete values or NULLs, 
                        and find potential dulicates or the number of NAs per column. We then get the summary of each column for a more detailed overview of values per feature parameter.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_7", placeholder = TRUE),

                        p("So there is no NULLs, missing values, or duplicates in the dataframe!", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        p("", style = "font-size: 18px;"),
                        p("Feature parameters", style = "text-align: justify; font-size: 20px; font-weight:bold;"),
                        p("The number of feature parameters is rather large for such a dataset, so we should reduce them to prevent overfitting in our regression models.
                        First we can check for correlation between our features, and visualize data as a heatmap.", style = "ptext-align: justify; adding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_8", placeholder = TRUE),
                        tags$img(src = "DC_Py_Heatmap.png", width = "30%"),
                        # here put the heatmap

                        p("A couple of feature parameters are highly co-correlated (|r| > 0.9). Examples are: T6 vs. T_out, T9 vs. T3/T5/T7, RH3 vs. RH4.
                        Either of these feature parameters can equally explain the variability in the response variable (i.e., Appliances), 
                        but we need to decide wich one to remove. We further visualizea the co-corelated feature parameters to confirm and deal with them. In this figure, 
                        we can see most of those features are highly co-correlated and show a very similar trend and a high variety of values.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_9", placeholder = TRUE),
                        tags$img(src = "DC_Py_correlation_lines.png", width = "30%"),
                        # here put the correlation plots

                        p("Beyond the cocorrelated feature parameters, some of these parameters are relatively unimportant for appliances, so can be removed from the data set prior to regression modelling. 
                        To select which variables are unimpotant and deserve to be removed from the dataframe, we can run a random forest with 100 trees 
                        and assess the relative influence of all feature parameters on Appliances.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_10", placeholder = TRUE),
                        tags$img(src = "DC_Py_VarImp.png", width = "30%"),
                        # here put the relative influence plot

                        p("The co-correlated parameters with least relative influence can also be removed from the data set. These parameters are: T_out, T7, and RH4.
                        Furthermore, least important feature parameters such as the two random variables of 'rv1' and 'rv2', and the 'Visibility' can also be removed from the data set.
                        'Lights' has also lots of null values which can be removed too. After removing these variables we come up with a total number of 21 feature parameters", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_11", placeholder = TRUE),

                        p("Now we check the distribution of the appliances and all features", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_12", placeholder = TRUE),
                        tags$img(src = "DC_Py_Histogram.png", width = "30%"),
                        # here put the histogram (distribution plot)
                        p("We can see that all the columns follow normal distribution except T9, RH_6, and wind speed. The appliances is also left-skewed", 
                        style = "text-align: justify; padding-top: 10px; font-size: 18px;"),

                        p("As the data was recorded at different times of the day or days of a week, and energy consumption (i.e. appliances) 
                        might depend on these parameters such as weekdays versus weekends or noon versus evenings, we can add 
                        (1) julian date to account for potential seasonality in data, and
                        (2) day of the week and hour of the day to account for time variability in energy consumption 
                        You can pull out individual parts of the date with the accessor functions yday() (day of the year), wday() (day of the week), hour(). 
                        Before fitting our selected features to the models, we need to normalize our feature parameters. 
                        Data normalization (here min-max scaling) enables us the opportunity to assess their relative 
                        influences on appliances without s judged by their relatively small or large values", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
                        verbatimTextOutput("Scripts_DCPy_13", placeholder = TRUE),
                        
                        p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
                        p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

                        )), column(width = 2)
                    )
        )
      ),
      tabItem("Scripts_AllAlgorithmsR",
        fluidRow(
          column(width = 1),
          column(width = 10, 
          p("Apply Machine-/Deep Learing algorithms in R", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("Here we apply five Machine Learning and one Deep Learning algorithms as promising tools to assess the predictability 
          of appliances energy consumption as our response variable. These six algorithms are from different categories.
          We will be looking at the following algorithms and categories: 
          KNeighborsRegressor (KNN) from Nearest neighbour Regression, Support Vector Regressor (SVR) from support vector machines,
          Random Forests (RF), Boosted Regression Trees (BRT), and Extra Trees Regression (ETR) from ensamble models, 
          and Artificial Neural Networks (ANN) from neural network models.", style = "text-align: justify; font-size: 18px;"),
          p("Import all necessary R-libraries:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsR_1", placeholder = TRUE),

          p("Load your data:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsR_2", placeholder = TRUE),

          p("Run a loop over the data to split the data set randomly into 75% train and 25% test sets for the 10-fold cross-validations and apply all six algorithms on each split
          to evaluate predictability of appliances energy consumption:", 
          style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsR_3", placeholder = TRUE),

          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

          )), column(width = 2)
      ),
      tabItem("Scripts_AllAlgorithmsPy",
        fluidRow(
          column(width = 1),
          column(width = 10, 
          p("Apply Machine-/Deep Learing algorithms in Python", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("Here we apply five Machine Learning and one Deep Learning algorithms as promising tools to assess the predictability 
          of appliances energy consumption as our response variable. These six algorithms are from different categories.
          We will be looking at the following algorithms and categories: 
          KNeighborsRegressor (KNN) from Nearest neighbour Regression, Support Vector Regressor (SVR) from support vector machines,
          Random Forests (RF), Boosted Regression Trees (BRT), and Extra Trees Regression (ETR) from ensamble models, 
          and Artificial Neural Networks (ANN) from neural network models.", style = "text-align: justify; font-size: 18px;"),

          p("Import all necessary Python libraries:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsPy_1", placeholder = TRUE),

          p("Load your data:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsPy_2", placeholder = TRUE),

          p("Print data column names for the next step to assemble features.", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          #p("Transfer dataframe to array and check output's schema. Then select the final data (i.e., your response variable and 
          #feature parameters) to be used in the subsequent ML steps", style = "padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsPy_3", placeholder = TRUE),

          p("Run a loop over the data to split the data for 10-fold cross-validation and apply RF algorithm on each split:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_AllAlgorithmsPy_4", placeholder = TRUE),

          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

          )), column(width = 2)
      ),
      tabItem("Visualization",
        fluidRow(
          column(width = 1),
          column(width = 10, 
          p("R and python model performances", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("The 10-fold cross-validation results show that the python models outperformed R models. This might be resulted from 
          model structures that varies across the platforms.", style = "text-align: justify; font-size: 18px;"),
          tags$img(src = "DV_R_Py_Final_comparisons.png", width = "30%"),
          # Here add cross-validation results

          p("xx was worst performing model with an R_score of 0.xx and median absolute error (MedAE) of xx. In contrast, 
          the two algorithms of Extra Trees Regression (R_score: 0.57, MedAE: xx) and Random Forests (R_score: 0.57, MedAE: xx) outperformed all other algorithms. 
          However, this does not mean thet deep learning and artificial neural networks (ANNs) are less powerfull than these algorithms. We ca 
          build complex ANNs that can perform as good as other powerful algorithms. In the next step, I show how we can build complex ANN models 
          without being prone to overfitting. You can find the ANN scripts under the 'Deep Learning' tab in the side bar.      
          ", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),

          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

          )), column(width = 2)
      ),
      tabItem("Scripts_ANNsPy",
        fluidRow(
          column(width = 1),
          column(width = 10, 
          p("Deep Learning (Artificial Neural Networks) in Python", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("Here we use Random Forests as a promising Machine Learning algorithm to assess the predictability of our response variable, and evaluate the relative influence of feature parameters.", 
          style = "text-align: justify; font-size: 18px;"),

          p("Import PySpark and all necessary Python libraries:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_ANNsPy_1", placeholder = TRUE),

          p("Load your data,  convert it into array, and define your response (Y) and feature (X) parameters:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_ANNsPy_2", placeholder = TRUE),

          p("Run a loop over the data to split the data for 10-fold cross-validation and apply ANNs algorithm on each split. At the same time, save evaluate the best models of each 
          of each split and save the results as csv-file :", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_ANNsPy_3", placeholder = TRUE),

          p("To track loss values online, you should follw the following steps:", style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          verbatimTextOutput("code_ANNsPy_4", placeholder = TRUE),
          tags$img(src = "Split_8.png", width = "30%"),
          # Here add the loss screenshots

          p("The evaluation results show that the appliances energy consumption can also be predicted using the Artificial Neural Networks as good as Random Forest and 
          Extra Trees regression algorithms. The performance of ANNs will become better once changing the model structure by adapting the number of hidden layers and neurons. 
          You can see model performances improve while increasing the number of hiden layers and neurons in the figure below:", 
          style = "text-align: justify; padding-top: 10px; font-size: 18px;"),
          tags$img(src = "ANNs_Final_comparisons.png", width = "30%"),
          # here put the bar plot of model evaluation progress with different dense and hiden layers

          p("To sum up, we need to take care of potential overfitting problems once increasing ANN model complexity. In my code, I have just 
          skipped a model if it was performing worse than any previous models, and in case of overfitting, the model was neither saved in the 
          directory nor evaluated for our final results shown in the figure above.", 
          style = "text-align: justify; padding-top: 10px; font-size: 18px;"),

          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;"),
          p("", style = "padding-top: 10px; font-size: 30px; font-weight:bold;")

          )), column(width = 2)
      )
    )
  )
)
