library(shiny)

shinyServer(function(input,output){
        model1<-lm(Height~Girth,data=trees)
        model2<-lm(Height~Volume,data=trees)
        model3<-lm(Height~Volume+Girth,data=trees)
        
        mod1pred<-reactive({
                girthInput<-input$sliderGirth
                predict(model1,newdata=data.frame(Girth=girthInput))
        })
        
        mod2pred<-reactive({
                volumeInput<-input$sliderVolume
                predict(model2,newdata=data.frame(Volume=volumeInput))
        })
        
        mod3pred<-reactive({
                girthInput<-input$sliderGirth
                volumeInput<-input$sliderVolume
                
                predict(model3,newdata=data.frame(Girth=girthInput,Volume=volumeInput))
        })
        
        
        output$plot1<-renderPlot({
                
                plot(trees$Girth,trees$Height,xlab="Diameter of Tree in Inches",ylab="Height of Tree in Feet",bty="n",pch=16)
        
                abline(model1,col="red",lwd=2)
                
                })
        output$plot2<-renderPlot({
                plot(trees$Volume,trees$Height,xlab="Volume of Timber in Cubic Inches",ylab="Height of Tree in Feet",bty="n",pch=16)
                
                abline(model2,col="red",lwd=2)
                
                })
        output$pred1<-renderText({
                mod1pred()
        })
        output$pred2<-renderText({
                mod2pred()
        })
        output$pred3<-renderText({
                mod3pred()
        })
        
        
                        
                
        })