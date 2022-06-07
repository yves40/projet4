<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The controller</title>
</head>
<body>
    <!-- commentaire HTML -->
    <?php
        //on écrit Hello World
        echo "<h1>Baboule a fait une tartiflette !!!!</h1>";
        echo "<br/>";

        for( $i = 0; $i  <10; $i++) {
            echo "<p>baboule est INCROYABLE !!!!!</p>";
        }
        echo "<br/>";
        $list = [ "One", "two", "three", "four", "five" ];
        echo count($list);
        echo "<br/>";
        foreach($list as $key => $value) {
            echo $value."/".$value;
            echo "<br/>";
        }
        $list2 = array("Key1" =>"One", 
            "Key2" => "Two",
            "Key3" => "Three",
        );
        foreach($list2 as $key => $value) {
            echo $key."/".$value;
            echo "<br/>";
        }
    ?>
    
</body>
</html>