package main

import "github.com/DavidHuie/quartz/go/quartz"

type Args struct {
	Num int
}

type Response struct {
	Sum int `json:"sum"`
}

type Function struct{}

func (f *Function) LoopNSum(args Args, response *Response) error {
	sum := 0

	for i := 0; i < args.Num; i++ {
		sum += i
	}

	*response = Response{sum}
	return nil
}

func main() {
	f := &Function{}
	quartz.RegisterName("functions", f)
	quartz.Start()
}
