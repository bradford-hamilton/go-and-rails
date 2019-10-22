package main

import (
	"strconv"

	"github.com/bradford-hamilton/go-and-rails/app/go/quartz"
)

type Args struct {
	Num int
}

type Response struct {
	Sum int    `json:"sum"`
	Str string `json:"str"`
}

type Function struct{}

func (f *Function) LoopNSum(args Args, response *Response) error {
	sum := 0

	for i := 0; i < args.Num; i++ {
		sum += i
	}

	*response = Response{Sum: sum}
	return nil
}

func (f *Function) LoopNString(args Args, response *Response) error {
	str := ""

	for i := 0; i < args.Num; i++ {
		str += strconv.Itoa(i)
	}

	*response = Response{Str: str}
	return nil
}

func main() {
	f := &Function{}
	quartz.RegisterName("functions", f)
	quartz.Start()
}
