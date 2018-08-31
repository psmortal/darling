package main

import "github.com/gin-gonic/gin"
import (
	"darling/db"
	"fmt"
	"time"
)
func main() {
	r:= gin.Default()

	r.Static("","/darling/view")
	//r.Static("","/Users/ydf/gopath/src/darling/view")
	r.POST("createclass", func(c *gin.Context) {
		var cl  = db.Class{}

		err:= c.BindJSON(&cl)
		if err != nil{
			fmt.Println("参数错误:",err.Error())
			c.JSON(200,"错误")
			return
		}
		fmt.Println(cl)
		cl.Date = time.Now().Format("2006-01-02")
		err= db.DB.Create(&cl).Error
		if err != nil{
			fmt.Println(err.Error())
			c.JSON(200,"错误")
			return
		}
		c.JSON(200,"www.wanjiafine.com/darling/signup?date=" + cl.Date + "&name=" + cl.Name)
	})
	r.Run(":9090")

}
