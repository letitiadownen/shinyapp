library(shiny)

shinyServer(function(input,output){
        mtcars$mpgsp<-ifelse(mtcars$mpg-20>0,mtcars$mpg-20,0)
        model1<-lm(hp~mpg,data=mtcars)
        model2<-lm(hp~mpgsp+mpg,data=mtcars)
        
        mod1pred<-reactive({
                mpgInput<-input$sliderMPG
                predit(model1,newdata=data.frame(mpg=mpgInput))
        })
        
        mod2pred<-reactive({
                mpgInput<-input$sliderMPG
                predict(model2,newdata=data.frame(mpg=mpgInput,mpgsp=ifelse(mpgInput-20>0,mpgInput-20,0)))
        })
        output$plot1<-renderPlot({
                
                mpgInput<-input$sliderMPG
                plot(mtcars$mpg,mtcars$hp,xlab="miles per gallon",xlab="",bty="n",pch=16,xlim=c(10,35),ylim=c(50,350))
        
                if(input$showModel1){
                        abline(model1,col="red",lwd=2)
                }
                })
        })