<?=$this->extend('layout/template');?>
<?=$this->section('content');?>  
<div class="container">
    <div class="row">
        <div class="col">
            <a href="/komik/create" class="btn btn-primary mt-2">Tambah Data Komik</a>
            <h3>Daftar Komik</h3>
            <?php if (session()->getFlashdata('pesan')):?>
                <div class="alert alert-success" role="alert">
                    <?= session()->getFlashdata('pesan');?>
                </div>
            <?php endif;?>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Sampul</th>
                        <th scope="col">Judul</th>
                        <th scope="col">Aksi</th>
                    </tr> 
                </thead>
                <tbody>
                <?php $i=1;?>
                <?php foreach($komik as $k):?>
                    <tr>
                        <th scope="row"><?= $i?></th>
                        <td><img id="sampul" src="/img/<?= $k['sampul'];?>" alt="jpg" class="img img-fluid"></th>
                        <td><?=$k['judul'];?></th>
                        <td><a href="/komik/<?= $k['slug'];?>"><button class="btn btn-success">Details</button></a></th>
                    </tr> 
                    <?php $i++;?>
                <?php endforeach;?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?=$this->endSection();?>


