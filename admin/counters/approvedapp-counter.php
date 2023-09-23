<?php
    include '../../includes/dbconn.php';

    $sql = "SELECT id from reservationtp WHERE Status = '0'";
    $query = $dbh -> prepare($sql);
    $query->execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    $leavtypcount=$query->rowCount();

    echo htmlentities($leavtypcount);

?>   