package db

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

var DB *gorm.DB

func init() {

	db, err := gorm.Open("mysql", "sifan:sifan@tcp(db:3306)/darling?charset=utf8&parseTime=True&loc=Local")
	//defer db.Close()
	if err != nil {
		panic(err.Error())
	}

	if err != nil{
		panic(err)
	}

	//db.SetLogger(DBLoger{})
	db.LogMode(true)

	//初始化数据库

	//单数表名
	db.SingularTable(true)

	db.AutoMigrate(
		&Class{},
		&People{},
		)
	DB = db

}

type Class struct {
	ID int
	Name string `json:"name"`
	Date string `json:"date"`
}

type People struct {
	ID int
	Name string
	Department string
}





