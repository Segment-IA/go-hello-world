package main

import (
    "testing"
    "github.com/stretchr/testify/suite"
)

type HelloWorldTestSuite struct {
    suite.Suite
}

func (suite *HelloWorldTestSuite) TestHelloWorld() {
    expected := "Hello, World!"
    actual := getHelloWorld()
    suite.Equal(expected, actual)
}

func getHelloWorld() string {
    return "Hello, World!"
}

func TestHelloWorldTestSuite(t *testing.T) {
    suite.Run(t, new(HelloWorldTestSuite))
}
