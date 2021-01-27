<h1 class="mt-4"><?= $title ?></h1>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item active"><?= $breadcumb ?></li>
</ol>
<div class="card pt-4 pl-5 pr-5">
	<form action="" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label for="isiLaporan" class="col-sm-3 col-form-label">Isi Laporan</label>
			<div class="col-sm-8">
				<textarea name="isi" class="form-control" id="isilaporan" rows="4" required ><?= set_value('tgl') ?></textarea>
				<small id="helpId" class="text-muted"><?php echo form_error('isi', '<div class="alert alert-danger mt-2">', '</div>'); ?></small>
			</div>
		</div>
		
        <div class="form-group row">
			<label for="foto" class="col-sm-3 col-form-label">Foto</label>
			<div class="col-sm-8">
				<input type="file" name="foto" id="foto" class="form-control" placeholder=""
					aria-describedby="helpId" value="<?= set_value('foto') ?>" required>
				<small id="helpId" class="text-muted"><?php echo form_error('foto', '<div class="alert alert-danger mt-2">', '</div>'); ?></small>
			</div>
		</div>
		
		<br>
<label for="isiLaporan" class="col-sm-3 col-form-label">Kategori Bencana</label>
		<select class="form-select" aria-label="Default select example">
  <option selected>*PILIHAN</option>
  <option value="<small id="helpId" class="text-muted"><?php echo form_error('kategori bencana', '<div class="alert alert-danger mt-2">', '</div>'); ?></small>1. Banjir</option>
  <option value="2">2. Rob</option>
  <option value="3">3. Tanah/Talud Longsor</option>
  <option value="3">4. Puting Beliung</option>
  <option value="3">5. Rumah Roboh</option>
  <option value="3">6. Kebakaran</option>
  <option value="3">7. Pohon Tumbang</option>
</select>
<br>
<br>
<br>
			 

        <div class="form-group row justify-content-center">
			<button type="reset" class="btn btn-danger mr-2">Reset</button>
			<a href="<?= base_url('pengaduan') ?>" class="btn btn-warning mr-2">Kembali</a>
			<button type="submit" class="btn btn-primary">Simpan</button>
		</div>
	</form>
</div>
