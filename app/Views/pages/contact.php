<?=$this->extend('layout/template');?>
<?=$this->section('content');?>  
<div class="container">
    <div class="row">
        <div class="col">
            <h3>Contact Us</h3>
            <?php foreach($alamat as $at):?>
            <ul>
                <li><?= $at['tipe'];?></li>
                <li><?= $at['alamat'];?></li>
                <li><?= $at['kota'];?></li>
            </ul>
            <?php endforeach;?>
        </div>
    </div>
</div>
<?=$this->endSection();?>