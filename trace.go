package mesos

import (
	"os"
)

var ApiTrace = false

func init() {
	if os.Getenv("MESOS_TRACE") != "" {
		ApiTrace = true
	}
}
