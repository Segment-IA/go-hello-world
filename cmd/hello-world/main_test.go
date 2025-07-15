package main

import (
	"testing"

	"github.com/stretchr/testify/suite"
)

type HelloWorldTestSuite struct {
	suite.Suite
	setupMessage string
}

func (suite *HelloWorldTestSuite) SetupSuite() {
	suite.setupMessage = "Hello, World!"
}

func (suite *HelloWorldTestSuite) TearDownSuite() {
	suite.setupMessage = ""
}

func (suite *HelloWorldTestSuite) TestHelloWorld() {
	// expected := "Hello, World!"
	actual := getHelloWorld()
	// suite.Equal(expected, actual)
	suite.Equal(actual, suite.setupMessage)
}

func getHelloWorld() string {
	return "Hello, World!"
}

func TestHelloWorldTestSuite(t *testing.T) {
	suite.Run(t, new(HelloWorldTestSuite))
}
