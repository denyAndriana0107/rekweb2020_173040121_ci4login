<?=$this->extend('layout/template');?>
<?=$this->section('content');?> 
<div class="container">
    <div class="row">
        <div class="col-8">
            <h2>Form Ubah Data Komik</h2>
            
<form action="/komik/update/<?= $komik['id'];?>" method="post" enctype="multipart/form-data">
    <?= csrf_field();?>
  <div class="form-group row">
    <label for="judul" class="col-sm-2 col-form-label">Judul</label>
    <input type="hidden" name="slug" value="<?= $komik['slug'];?>">
    <input type="hidden" name="sampulLama" value="<?= $komik['sampul'];?>">
    <div class="col-sm-10">
      <input type="text" class="form-control <?=($validation->hasError('judul'))?'is-invalid':'';?>" id="judul" name="judul" autofocus value="<?= (old('judul'))?old('judul'):$komik['judul'];?>">
      <div class="invalid-feedback">
        <?=$validation->getError('judul');?>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="penulis" class="col-sm-2 col-form-label">Penulis</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="penulis" name="penulis" value="<?=(old('penulis'))?old('penulis'):$komik['penulis'];?>">
    </div>
  </div>
  <div class="form-group row">
    <label for="penerbit" class="col-sm-2 col-form-label">Penerbit</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="penerbit" name="penerbit" value="<?=(old('penerbit'))?old('penerbit'):$komik['penerbit'];?>">
    </div>
  </div>
  <div class="form-group row">
  <label for="sampul" class="col-sm-2 col-form-label">Sampul</label>
    <div class="col-2">
      <img src="/img/<?=$komik['sampul']?>" alt="jpg" class="img-thumbnail img-preview">
    </div>
    <div class="col-sm-8">
      <div class="custom-file">
        <input type="file" class="custom-file-input form-control <?=($validation->hasError('sampul'))?'is-invalid':'';?>" id="sampul" name="sampul" onchange="preview()">
        <div class="invalid-feedback">
        <?=$validation->getError('sampul');?>
        </div>
        <label for="sampul" class="custom-file-label"><?=$komik['sampul']?></label>
    </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Ubah Komik </button>
    </div>
  </div>
</form>
        </div>
    </div>
</div>
<?=$this->endSection();?>