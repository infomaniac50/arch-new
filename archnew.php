<?php

$gzipoutput = file_get_contents("https://github.com/infomaniac50/arch-new/archive/v0.1.tar.gz");

header('Content-Type: application/x-download');
header('Content-Encoding: gzip'); #
header('Content-Length: '.strlen($gzipoutput)); #
header('Content-Disposition: attachment; filename="myfile.name"');
header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');
header('Pragma: no-cache');

echo $gzipoutput;