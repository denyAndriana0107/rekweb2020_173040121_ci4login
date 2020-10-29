<?=$this->extend('layout/template');?>
<?=$this->section('content');?>  
<div class="container">
    <div class="row">
        <div class="col">
        
            <nav class="navbar navbar-light bg-light">
            <h3>Daftar Orang</h3>
             <form class="form-inline" method="POST" action="">
                <input class="form-control mr-sm-2" type="search" placeholder="Cari" aria-label="Search" name="keyword">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
             </form>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <!-- <a href="/komik/create" class="btn btn-primary mt-2">Tambah Data Komik</a> -->
            
            
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Alamat</th>
                        <th scope="col">Aksi</th>
                    </tr> 
                </thead>
                <tbody>
                <?php $i=1+(10*($currentPage-1));?>
                <?php foreach($orang as $o):?>
                    <tr>
                        <th scope="row"><?= $i;?></th>
                        <td><?= $o['nama'];?></th>
                        <td><?= $o['alamat'];?></th>
                        <td><a href=""><button class="btn btn-success">Details</button></a></th>
                    </tr> 
                    <?php $i++;?>
                <?php endforeach;?>
                </tbody>
            </table>
            <?= $pager->links('orang','orang_pagination');?>
        </div>
    </div>
</div>
<?=$this->endSection();?>


