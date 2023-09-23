<?php
    session_start();
    error_reporting(0);
    include('../includes/dbconn.php');
    if(strlen($_SESSION['alogin'])==0){   
    header('location:index.php');
    } else {

    // code for update the read notification status
    $isread=1;
    $did=intval($_GET['leaveid']);  
    date_default_timezone_set('Asia/Kolkata');
    $admremarkdate=date('Y-m-d G:i:s ', strtotime("now"));
    $sql="UPDATE rattrapage set IsRead=:isread where id=:did";
    $query = $dbh->prepare($sql);
    $query->bindParam(':isread',$isread,PDO::PARAM_STR);
    $query->bindParam(':did',$did,PDO::PARAM_STR);
    $query->execute();

    // code for action taken on leave
    if(isset($_POST['update'])){ 
    $did=intval($_GET['leaveid']);
    $description=$_POST['description'];
    $status=$_POST['status'];
    $NomSalle=$_POST['salle'];   
    date_default_timezone_set('Asia/Kolkata');
    $admremarkdate=date('Y-m-d G:i:s ', strtotime("now"));

    $sql="UPDATE rattrapage set AdminRemark=:description,Status=:status,AdminRemarkDate=:admremarkdate,NomSalle=:salle where id=:did";
    $query = $dbh->prepare($sql);
    $query->bindParam(':description',$description,PDO::PARAM_STR);
    $query->bindParam(':status',$status,PDO::PARAM_STR);
    $query->bindParam(':admremarkdate',$admremarkdate,PDO::PARAM_STR);
    $query->bindParam(':salle',$NomSalle,PDO::PARAM_STR);

    $query->bindParam(':did',$did,PDO::PARAM_STR);
    
    $query->execute();
    $msg="Leave updated Successfully";
    } ?>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="../assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/metisMenu.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="../assets/css/typography.css">
    <link rel="stylesheet" href="../assets/css/default-css.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="dashboard.php"><img src="../assets/images/icon/iset.png" alt="logo"></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <?php $page="employee";
                    include '../includes/admin-sidebar.php'
                    ?>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    <div class="col-md-6 col-sm-8 clearfix">
                        <div class="nav-btn pull-left">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        
                    </div>
                    <!-- profile info & task notification -->
                    <div class="col-md-6 col-sm-4 clearfix">
                        <ul class="notification-area pull-right">
                            <li id="full-view"><i class="ti-fullscreen"></i></li>
                            <li id="full-view-exit"><i class="ti-zoom-out"></i></li>

                            <!-- Notification bell -->
                            <?php include '../includes/admin-notification.php'?>

                        </ul>
                    </div>
                </div>
            </div>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Rattrapage Details</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="dashboard.php">Home</a></li>
                                <li><span>Details</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="../assets/images/admin.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Chef de Departement <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="logout.php">Se déconnecter</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
               
                
                <!-- row area start -->
                <div class="row">
                    
                    <!-- Striped table start -->
                    <div class="col-lg-12 mt-5">
                    <?php if($error){?><div class="alert alert-danger alert-dismissible fade show"><strong>Info: </strong><?php echo htmlentities($error); ?>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            
                             </div><?php } 
                                 else if($msg){?><div class="alert alert-success alert-dismissible fade show"><strong>Info: </strong><?php echo htmlentities($msg); ?> 
                                 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                 </div><?php }?>
                        <div class="card">
                            <div class="card-body">
                                
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover text-center">
                                            
                                            <tbody>

                                            <?php 
                                            $lid=intval($_GET['leaveid']);
                                            $sql = "SELECT rattrapage.id as lid,tblemployees.FirstName,tblemployees.LastName,tblemployees.EmpId,tblemployees.id,tblemployees.Gender,tblemployees.Phonenumber,tblemployees.EmailId,rattrapage.NomMatiere,rattrapage.ToDate,rattrapage.FromDate,rattrapage.Description,rattrapage.PostingDate,rattrapage.Status,rattrapage.AdminRemark,rattrapage.AdminRemarkDate,rattrapage.NomClasse,rattrapage.NomSalle from rattrapage join tblemployees on rattrapage.empid=tblemployees.id where rattrapage.id=:lid";
                                            $query = $dbh -> prepare($sql);
                                            $query->bindParam(':lid',$lid,PDO::PARAM_STR);
                                            $query->execute();
                                            $results=$query->fetchAll(PDO::FETCH_OBJ);
                                            $cnt=1;
                                            if($query->rowCount() > 0)
                                            {
                                            foreach($results as $result)
                                            {         
                                                ?>

                                                <tr>

                                                <td ><b>ID ENSEIGNANT:</b></td>
                                              <td colspan="1"><?php echo htmlentities($result->EmpId);?></td>
                                            <td> <b>UserName:</b></td>
                                              <td colspan="1"><a href="update-employee.php?empid=<?php echo htmlentities($result->id);?>" target="_blank">
                                                <?php echo htmlentities($result->FirstName." ".$result->LastName);?></a></td>

                                                <td ><b>ENSEIGNANT Email:</b></td>
                                            <td colspan="1"><?php echo htmlentities($result->EmailId);?></td>
                                             </tr>


                                    <tr>
                                    <td ><b>Matiere</b></td>
                                            <td colspan="1"><?php echo htmlentities($result->NomMatiere);?></td> 
                                             <td ><b>Date d'absence:</b></td>
                                            <td colspan="1"><?php echo htmlentities($result->FromDate);?></td>
                                            <td><b>Date de Rattrapage</b></td>
                                            <td colspan="1"><?php echo htmlentities($result->ToDate);?></td>
                                            
                                        </tr>

                                        <tr>
                                     <td ><b>Description </b></td>
                                     <td colspan="3"><?php echo htmlentities($result->Description);?></td>
                                     <td ><b>Envoyée</b></td>
                                <td colspan="2"><?php echo htmlentities($result->PostingDate);?></td>
                                    
                                </tr>
<tr>
                                    <td ><b>Classe </b></td>
                                     <td colspan="5"><?php echo htmlentities($result->NomClasse);?></td>

</tr>
<tr>
    <td colspan="6">&nbsp</td>
</tr>

<tr>

                                     <td ><b>Status:</b></td>
                                <td colspan="3"><?php $stats=$result->Status;
                                if($stats==1){
                                ?>
                                    <span style="color: green">Accepteé</span>
                                    <?php } if($stats==2)  { ?>
                                    <span style="color: red">Declineé</span>
                                    <?php } if($stats==0)  { ?>
                                    <span style="color: blue">En-Attende</span>
                                    <?php } ?>
                                    </td>
                                    <td ><b>Salle </b></td>
                                            <td colspan="2"><?php echo htmlentities($result->NomSalle);?></td> 

                                                                          
                                </tr>

                                
                                <tr rowspan="2">
                                    <td ><b>Commentaire d'admin </b></td>
                                    <td colspan="12"><?php
                                    if($result->AdminRemark==""){
                                    echo "Waiting for Action";  
                                    }
                                    else{
                                    echo htmlentities($result->AdminRemark);
                                    }
                                    ?></td>
                                </tr>
<tr></tr>
                                <tr>
                               <td colspan="4"></td>
                                <td >
                                    <b>Admin Action On: </b></td>
                                    <td><?php
                                    if($result->AdminRemarkDate==""){
                                    echo "NA";  
                                    }
                                    else{
                                    echo htmlentities($result->AdminRemarkDate);
                                    }
                                    ?></td>
                                </tr>
                                <?php 
                                if($stats==0)
                                {

                                ?>
                            <tr>
                            <td colspan="12">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">SET ACTION</button>
                            
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">SET ACTION</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <form method="POST" name="adminaction">
                                <div class="modal-body">

                                    <label class="col-form-label">Salle</label>
                                            <select class="custom-select" name="salle" autocomplete="off">
                                                <option value="">Selectioner Salle effectuée </option>

                                                <?php $sql = "SELECT NomSalle from salle";
                                                    $query = $dbh -> prepare($sql);
                                                    $query->execute();
                                                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                                                    $cnt=1;
                                                    if($query->rowCount() > 0) {
                                                        foreach($results as $result)
                                                {   ?> 
                                                <option value="<?php echo htmlentities($result->NomSalle);?>"><?php echo htmlentities($result->NomSalle);?></option>
                                                <?php }
                                            } ?>
                                            </select>
                                            <label class="col-form-label">Status</label>
                                            <label class="col-form-label">&nbsp;</label>

                                    <select class="custom-select" name="status" required="">
                                        <option value="">Selectioner...</option>
                                        <option value="1">Acceptée</option>
                                        <option value="2">Declinée</option>

                                        
                                    </select></p>

                                    <br>
                                    <p><textarea id="textarea1" name="description" class="form-control" name="description" placeholder="Description" row="5" maxlength="500" required></textarea></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-success" name="update">Apply</button>
                                </div>
                                </div>
                            </div>
                            </div>

                            </td>
                            </tr>
                            <?php } ?>
                            </form>
                             </tr>
                                         <?php $cnt++;} }?>
                                    </tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Striped table end -->
                    
                </div>
                <!-- row area end -->
                
                </div>
                <!-- row area start-->
            </div>
            <?php include '../includes/footer.php' ?>
        <!-- footer area end-->
        </div>
		
        <!-- main content area end -->

        

    </div>
    <!-- jquery latest version -->
    <script src="../assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/metisMenu.min.js"></script>
    <script src="../assets/js/jquery.slimscroll.min.js"></script>
    <script src="../assets/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="assets/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets/js/pie-chart.js"></script>
    
    <!-- others plugins -->
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/scripts.js"></script>
</body>

</html>

<?php } ?>