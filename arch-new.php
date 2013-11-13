<?php

header("Content-Type: text/plain");

function println($string) {
	echo $string;
	echo "\n";
}

println('curl -Ss http://coding-squared.com/arch-new.tar.gz | tar -xz --no-same-owner --no-same-permissions -f -');
println('echo "Please run \'bash start.sh\'"');