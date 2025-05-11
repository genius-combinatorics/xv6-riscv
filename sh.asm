
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	e426                	sd	s1,8(sp)
       8:	e04a                	sd	s2,0(sp)
       a:	1000                	addi	s0,sp,32
       c:	84aa                	mv	s1,a0
       e:	892e                	mv	s2,a1
  write(2, "rozhina‑yekta$ ", 16);
      10:	4641                	li	a2,16
      12:	00001597          	auipc	a1,0x1
      16:	2be58593          	addi	a1,a1,702 # 12d0 <malloc+0xde>
      1a:	4509                	li	a0,2
      1c:	52b000ef          	jal	ra,d46 <write>
  memset(buf, 0, nbuf);
      20:	864a                	mv	a2,s2
      22:	4581                	li	a1,0
      24:	8526                	mv	a0,s1
      26:	319000ef          	jal	ra,b3e <memset>
  gets(buf, nbuf);
      2a:	85ca                	mv	a1,s2
      2c:	8526                	mv	a0,s1
      2e:	357000ef          	jal	ra,b84 <gets>
  if(buf[0] == 0) // EOF
      32:	0004c503          	lbu	a0,0(s1)
      36:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
      3a:	40a00533          	neg	a0,a0
      3e:	60e2                	ld	ra,24(sp)
      40:	6442                	ld	s0,16(sp)
      42:	64a2                	ld	s1,8(sp)
      44:	6902                	ld	s2,0(sp)
      46:	6105                	addi	sp,sp,32
      48:	8082                	ret

000000000000004a <panic>:
  exit(0);
}

void
panic(char *s)
{
      4a:	1141                	addi	sp,sp,-16
      4c:	e406                	sd	ra,8(sp)
      4e:	e022                	sd	s0,0(sp)
      50:	0800                	addi	s0,sp,16
      52:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
      54:	00001597          	auipc	a1,0x1
      58:	29458593          	addi	a1,a1,660 # 12e8 <malloc+0xf6>
      5c:	4509                	li	a0,2
      5e:	0b0010ef          	jal	ra,110e <fprintf>
  exit(1);
      62:	4505                	li	a0,1
      64:	4c3000ef          	jal	ra,d26 <exit>

0000000000000068 <fork1>:
}

int
fork1(void)
{
      68:	1141                	addi	sp,sp,-16
      6a:	e406                	sd	ra,8(sp)
      6c:	e022                	sd	s0,0(sp)
      6e:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
      70:	4af000ef          	jal	ra,d1e <fork>
  if(pid == -1)
      74:	57fd                	li	a5,-1
      76:	00f50663          	beq	a0,a5,82 <fork1+0x1a>
    panic("fork");
  return pid;
}
      7a:	60a2                	ld	ra,8(sp)
      7c:	6402                	ld	s0,0(sp)
      7e:	0141                	addi	sp,sp,16
      80:	8082                	ret
    panic("fork");
      82:	00001517          	auipc	a0,0x1
      86:	26e50513          	addi	a0,a0,622 # 12f0 <malloc+0xfe>
      8a:	fc1ff0ef          	jal	ra,4a <panic>

000000000000008e <runcmd>:
{
      8e:	bb010113          	addi	sp,sp,-1104
      92:	44113423          	sd	ra,1096(sp)
      96:	44813023          	sd	s0,1088(sp)
      9a:	42913c23          	sd	s1,1080(sp)
      9e:	43213823          	sd	s2,1072(sp)
      a2:	43313423          	sd	s3,1064(sp)
      a6:	43413023          	sd	s4,1056(sp)
      aa:	41513c23          	sd	s5,1048(sp)
      ae:	41613823          	sd	s6,1040(sp)
      b2:	45010413          	addi	s0,sp,1104
  if(cmd == 0)
      b6:	c10d                	beqz	a0,d8 <runcmd+0x4a>
      b8:	84aa                	mv	s1,a0
  switch(cmd->type){
      ba:	4118                	lw	a4,0(a0)
      bc:	4795                	li	a5,5
      be:	02e7e063          	bltu	a5,a4,de <runcmd+0x50>
      c2:	00056783          	lwu	a5,0(a0)
      c6:	078a                	slli	a5,a5,0x2
      c8:	00001717          	auipc	a4,0x1
      cc:	35870713          	addi	a4,a4,856 # 1420 <malloc+0x22e>
      d0:	97ba                	add	a5,a5,a4
      d2:	439c                	lw	a5,0(a5)
      d4:	97ba                	add	a5,a5,a4
      d6:	8782                	jr	a5
    exit(1);
      d8:	4505                	li	a0,1
      da:	44d000ef          	jal	ra,d26 <exit>
    panic("runcmd");
      de:	00001517          	auipc	a0,0x1
      e2:	21a50513          	addi	a0,a0,538 # 12f8 <malloc+0x106>
      e6:	f65ff0ef          	jal	ra,4a <panic>
    if(ecmd->argv[0] == 0)
      ea:	00853983          	ld	s3,8(a0)
      ee:	02098b63          	beqz	s3,124 <runcmd+0x96>
    if(strcmp(ecmd->argv[0], "!") == 0){
      f2:	00001597          	auipc	a1,0x1
      f6:	20e58593          	addi	a1,a1,526 # 1300 <malloc+0x10e>
      fa:	854e                	mv	a0,s3
      fc:	1ed000ef          	jal	ra,ae8 <strcmp>
     100:	892a                	mv	s2,a0
     102:	10051763          	bnez	a0,210 <runcmd+0x182>
      msg[0] = 0;
     106:	ba040c23          	sb	zero,-1096(s0)
      for(int i = 1; ecmd->argv[i]; i++){
     10a:	689c                	ld	a5,16(s1)
     10c:	0e078763          	beqz	a5,1fa <runcmd+0x16c>
     110:	01848813          	addi	a6,s1,24
      int len = 0;
     114:	84aa                	mv	s1,a0
        for(int j = 0; w[j] && len < sizeof(msg)-1; j++)
     116:	3fe00513          	li	a0,1022
     11a:	3ff00613          	li	a2,1023
          msg[len++] = ' ';
     11e:	02000893          	li	a7,32
     122:	a015                	j	146 <runcmd+0xb8>
      exit(1);
     124:	4505                	li	a0,1
     126:	401000ef          	jal	ra,d26 <exit>
        if(ecmd->argv[i+1] && len < sizeof(msg)-1)
     12a:	00083783          	ld	a5,0(a6)
     12e:	c7a1                	beqz	a5,176 <runcmd+0xe8>
     130:	0004871b          	sext.w	a4,s1
     134:	00e56863          	bltu	a0,a4,144 <runcmd+0xb6>
          msg[len++] = ' ';
     138:	fc040713          	addi	a4,s0,-64
     13c:	9726                	add	a4,a4,s1
     13e:	bf170c23          	sb	a7,-1032(a4)
     142:	2485                	addiw	s1,s1,1
      for(int i = 1; ecmd->argv[i]; i++){
     144:	0821                	addi	a6,a6,8
        for(int j = 0; w[j] && len < sizeof(msg)-1; j++)
     146:	0007c703          	lbu	a4,0(a5)
     14a:	d365                	beqz	a4,12a <runcmd+0x9c>
     14c:	0004859b          	sext.w	a1,s1
     150:	bb840693          	addi	a3,s0,-1096
     154:	96a6                	add	a3,a3,s1
     156:	0785                	addi	a5,a5,1
     158:	00b56c63          	bltu	a0,a1,170 <runcmd+0xe2>
          msg[len++] = w[j];
     15c:	2485                	addiw	s1,s1,1
     15e:	00e68023          	sb	a4,0(a3)
        for(int j = 0; w[j] && len < sizeof(msg)-1; j++)
     162:	0007c703          	lbu	a4,0(a5)
     166:	d371                	beqz	a4,12a <runcmd+0x9c>
     168:	0685                	addi	a3,a3,1
     16a:	0785                	addi	a5,a5,1
     16c:	fec498e3          	bne	s1,a2,15c <runcmd+0xce>
        if(ecmd->argv[i+1] && len < sizeof(msg)-1)
     170:	00083783          	ld	a5,0(a6)
     174:	fbe1                	bnez	a5,144 <runcmd+0xb6>
      msg[len] = 0;           
     176:	fc040793          	addi	a5,s0,-64
     17a:	97a6                	add	a5,a5,s1
     17c:	be078c23          	sb	zero,-1032(a5)
      if(len > 512){
     180:	20000793          	li	a5,512
     184:	0097cb63          	blt	a5,s1,19a <runcmd+0x10c>
        if(i+1 < len && msg[i] == 'o' && msg[i+1] == 's'){
     188:	06f00a13          	li	s4,111
     18c:	07300a93          	li	s5,115
          write(2, "\033[34mos\033[0m", 11);
     190:	00001b17          	auipc	s6,0x1
     194:	190b0b13          	addi	s6,s6,400 # 1320 <malloc+0x12e>
     198:	a02d                	j	1c2 <runcmd+0x134>
        write(2, "Message too long\n", 17);
     19a:	4645                	li	a2,17
     19c:	00001597          	auipc	a1,0x1
     1a0:	16c58593          	addi	a1,a1,364 # 1308 <malloc+0x116>
     1a4:	4509                	li	a0,2
     1a6:	3a1000ef          	jal	ra,d46 <write>
        exit(0);
     1aa:	4501                	li	a0,0
     1ac:	37b000ef          	jal	ra,d26 <exit>
          write(2, &msg[i], 1);
     1b0:	4605                	li	a2,1
     1b2:	bb840793          	addi	a5,s0,-1096
     1b6:	012785b3          	add	a1,a5,s2
     1ba:	4509                	li	a0,2
     1bc:	38b000ef          	jal	ra,d46 <write>
      int len = 0;
     1c0:	894e                	mv	s2,s3
      while(i < len){
     1c2:	02995c63          	bge	s2,s1,1fa <runcmd+0x16c>
        if(i+1 < len && msg[i] == 'o' && msg[i+1] == 's'){
     1c6:	0019099b          	addiw	s3,s2,1
     1ca:	fe99d3e3          	bge	s3,s1,1b0 <runcmd+0x122>
     1ce:	fc040793          	addi	a5,s0,-64
     1d2:	97ca                	add	a5,a5,s2
     1d4:	bf87c783          	lbu	a5,-1032(a5)
     1d8:	fd479ce3          	bne	a5,s4,1b0 <runcmd+0x122>
     1dc:	fc040793          	addi	a5,s0,-64
     1e0:	97ce                	add	a5,a5,s3
     1e2:	bf87c783          	lbu	a5,-1032(a5)
     1e6:	fd5795e3          	bne	a5,s5,1b0 <runcmd+0x122>
          write(2, "\033[34mos\033[0m", 11);
     1ea:	462d                	li	a2,11
     1ec:	85da                	mv	a1,s6
     1ee:	4509                	li	a0,2
     1f0:	357000ef          	jal	ra,d46 <write>
          i += 2;
     1f4:	0029099b          	addiw	s3,s2,2
     1f8:	b7e1                	j	1c0 <runcmd+0x132>
      write(2, "\n", 1);
     1fa:	4605                	li	a2,1
     1fc:	00001597          	auipc	a1,0x1
     200:	11c58593          	addi	a1,a1,284 # 1318 <malloc+0x126>
     204:	4509                	li	a0,2
     206:	341000ef          	jal	ra,d46 <write>
      exit(0);
     20a:	4501                	li	a0,0
     20c:	31b000ef          	jal	ra,d26 <exit>
    exec(ecmd->argv[0], ecmd->argv);
     210:	00848593          	addi	a1,s1,8
     214:	854e                	mv	a0,s3
     216:	349000ef          	jal	ra,d5e <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     21a:	6490                	ld	a2,8(s1)
     21c:	00001597          	auipc	a1,0x1
     220:	11458593          	addi	a1,a1,276 # 1330 <malloc+0x13e>
     224:	4509                	li	a0,2
     226:	6e9000ef          	jal	ra,110e <fprintf>
    break;
     22a:	a8d9                	j	300 <runcmd+0x272>
    close(rcmd->fd);
     22c:	5148                	lw	a0,36(a0)
     22e:	321000ef          	jal	ra,d4e <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     232:	508c                	lw	a1,32(s1)
     234:	6888                	ld	a0,16(s1)
     236:	331000ef          	jal	ra,d66 <open>
     23a:	00054563          	bltz	a0,244 <runcmd+0x1b6>
    runcmd(rcmd->cmd);
     23e:	6488                	ld	a0,8(s1)
     240:	e4fff0ef          	jal	ra,8e <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     244:	6890                	ld	a2,16(s1)
     246:	00001597          	auipc	a1,0x1
     24a:	0fa58593          	addi	a1,a1,250 # 1340 <malloc+0x14e>
     24e:	4509                	li	a0,2
     250:	6bf000ef          	jal	ra,110e <fprintf>
      exit(1);
     254:	4505                	li	a0,1
     256:	2d1000ef          	jal	ra,d26 <exit>
    if(fork1() == 0)
     25a:	e0fff0ef          	jal	ra,68 <fork1>
     25e:	e501                	bnez	a0,266 <runcmd+0x1d8>
      runcmd(lcmd->left);
     260:	6488                	ld	a0,8(s1)
     262:	e2dff0ef          	jal	ra,8e <runcmd>
    wait(0);
     266:	4501                	li	a0,0
     268:	2c7000ef          	jal	ra,d2e <wait>
    runcmd(lcmd->right);
     26c:	6888                	ld	a0,16(s1)
     26e:	e21ff0ef          	jal	ra,8e <runcmd>
    if(pipe(p) < 0)
     272:	fb840513          	addi	a0,s0,-72
     276:	2c1000ef          	jal	ra,d36 <pipe>
     27a:	02054763          	bltz	a0,2a8 <runcmd+0x21a>
    if(fork1() == 0){
     27e:	debff0ef          	jal	ra,68 <fork1>
     282:	e90d                	bnez	a0,2b4 <runcmd+0x226>
      close(1);
     284:	4505                	li	a0,1
     286:	2c9000ef          	jal	ra,d4e <close>
      dup(p[1]);
     28a:	fbc42503          	lw	a0,-68(s0)
     28e:	311000ef          	jal	ra,d9e <dup>
      close(p[0]);
     292:	fb842503          	lw	a0,-72(s0)
     296:	2b9000ef          	jal	ra,d4e <close>
      close(p[1]);
     29a:	fbc42503          	lw	a0,-68(s0)
     29e:	2b1000ef          	jal	ra,d4e <close>
      runcmd(pcmd->left);
     2a2:	6488                	ld	a0,8(s1)
     2a4:	debff0ef          	jal	ra,8e <runcmd>
      panic("pipe");
     2a8:	00001517          	auipc	a0,0x1
     2ac:	0a850513          	addi	a0,a0,168 # 1350 <malloc+0x15e>
     2b0:	d9bff0ef          	jal	ra,4a <panic>
    if(fork1() == 0){
     2b4:	db5ff0ef          	jal	ra,68 <fork1>
     2b8:	e115                	bnez	a0,2dc <runcmd+0x24e>
      close(0);
     2ba:	295000ef          	jal	ra,d4e <close>
      dup(p[0]);
     2be:	fb842503          	lw	a0,-72(s0)
     2c2:	2dd000ef          	jal	ra,d9e <dup>
      close(p[0]);
     2c6:	fb842503          	lw	a0,-72(s0)
     2ca:	285000ef          	jal	ra,d4e <close>
      close(p[1]);
     2ce:	fbc42503          	lw	a0,-68(s0)
     2d2:	27d000ef          	jal	ra,d4e <close>
      runcmd(pcmd->right);
     2d6:	6888                	ld	a0,16(s1)
     2d8:	db7ff0ef          	jal	ra,8e <runcmd>
    close(p[0]);
     2dc:	fb842503          	lw	a0,-72(s0)
     2e0:	26f000ef          	jal	ra,d4e <close>
    close(p[1]);
     2e4:	fbc42503          	lw	a0,-68(s0)
     2e8:	267000ef          	jal	ra,d4e <close>
    wait(0);
     2ec:	4501                	li	a0,0
     2ee:	241000ef          	jal	ra,d2e <wait>
    wait(0);
     2f2:	4501                	li	a0,0
     2f4:	23b000ef          	jal	ra,d2e <wait>
    break;
     2f8:	a021                	j	300 <runcmd+0x272>
    if(fork1() == 0)
     2fa:	d6fff0ef          	jal	ra,68 <fork1>
     2fe:	c501                	beqz	a0,306 <runcmd+0x278>
  exit(0);
     300:	4501                	li	a0,0
     302:	225000ef          	jal	ra,d26 <exit>
      runcmd(bcmd->cmd);
     306:	6488                	ld	a0,8(s1)
     308:	d87ff0ef          	jal	ra,8e <runcmd>

000000000000030c <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     30c:	1101                	addi	sp,sp,-32
     30e:	ec06                	sd	ra,24(sp)
     310:	e822                	sd	s0,16(sp)
     312:	e426                	sd	s1,8(sp)
     314:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     316:	0a800513          	li	a0,168
     31a:	6d9000ef          	jal	ra,11f2 <malloc>
     31e:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     320:	0a800613          	li	a2,168
     324:	4581                	li	a1,0
     326:	019000ef          	jal	ra,b3e <memset>
  cmd->type = EXEC;
     32a:	4785                	li	a5,1
     32c:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     32e:	8526                	mv	a0,s1
     330:	60e2                	ld	ra,24(sp)
     332:	6442                	ld	s0,16(sp)
     334:	64a2                	ld	s1,8(sp)
     336:	6105                	addi	sp,sp,32
     338:	8082                	ret

000000000000033a <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     33a:	7139                	addi	sp,sp,-64
     33c:	fc06                	sd	ra,56(sp)
     33e:	f822                	sd	s0,48(sp)
     340:	f426                	sd	s1,40(sp)
     342:	f04a                	sd	s2,32(sp)
     344:	ec4e                	sd	s3,24(sp)
     346:	e852                	sd	s4,16(sp)
     348:	e456                	sd	s5,8(sp)
     34a:	e05a                	sd	s6,0(sp)
     34c:	0080                	addi	s0,sp,64
     34e:	8b2a                	mv	s6,a0
     350:	8aae                	mv	s5,a1
     352:	8a32                	mv	s4,a2
     354:	89b6                	mv	s3,a3
     356:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     358:	02800513          	li	a0,40
     35c:	697000ef          	jal	ra,11f2 <malloc>
     360:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     362:	02800613          	li	a2,40
     366:	4581                	li	a1,0
     368:	7d6000ef          	jal	ra,b3e <memset>
  cmd->type = REDIR;
     36c:	4789                	li	a5,2
     36e:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     370:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     374:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     378:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     37c:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     380:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     384:	8526                	mv	a0,s1
     386:	70e2                	ld	ra,56(sp)
     388:	7442                	ld	s0,48(sp)
     38a:	74a2                	ld	s1,40(sp)
     38c:	7902                	ld	s2,32(sp)
     38e:	69e2                	ld	s3,24(sp)
     390:	6a42                	ld	s4,16(sp)
     392:	6aa2                	ld	s5,8(sp)
     394:	6b02                	ld	s6,0(sp)
     396:	6121                	addi	sp,sp,64
     398:	8082                	ret

000000000000039a <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     39a:	7179                	addi	sp,sp,-48
     39c:	f406                	sd	ra,40(sp)
     39e:	f022                	sd	s0,32(sp)
     3a0:	ec26                	sd	s1,24(sp)
     3a2:	e84a                	sd	s2,16(sp)
     3a4:	e44e                	sd	s3,8(sp)
     3a6:	1800                	addi	s0,sp,48
     3a8:	89aa                	mv	s3,a0
     3aa:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3ac:	4561                	li	a0,24
     3ae:	645000ef          	jal	ra,11f2 <malloc>
     3b2:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     3b4:	4661                	li	a2,24
     3b6:	4581                	li	a1,0
     3b8:	786000ef          	jal	ra,b3e <memset>
  cmd->type = PIPE;
     3bc:	478d                	li	a5,3
     3be:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     3c0:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     3c4:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     3c8:	8526                	mv	a0,s1
     3ca:	70a2                	ld	ra,40(sp)
     3cc:	7402                	ld	s0,32(sp)
     3ce:	64e2                	ld	s1,24(sp)
     3d0:	6942                	ld	s2,16(sp)
     3d2:	69a2                	ld	s3,8(sp)
     3d4:	6145                	addi	sp,sp,48
     3d6:	8082                	ret

00000000000003d8 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3d8:	7179                	addi	sp,sp,-48
     3da:	f406                	sd	ra,40(sp)
     3dc:	f022                	sd	s0,32(sp)
     3de:	ec26                	sd	s1,24(sp)
     3e0:	e84a                	sd	s2,16(sp)
     3e2:	e44e                	sd	s3,8(sp)
     3e4:	1800                	addi	s0,sp,48
     3e6:	89aa                	mv	s3,a0
     3e8:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3ea:	4561                	li	a0,24
     3ec:	607000ef          	jal	ra,11f2 <malloc>
     3f0:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     3f2:	4661                	li	a2,24
     3f4:	4581                	li	a1,0
     3f6:	748000ef          	jal	ra,b3e <memset>
  cmd->type = LIST;
     3fa:	4791                	li	a5,4
     3fc:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     3fe:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     402:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     406:	8526                	mv	a0,s1
     408:	70a2                	ld	ra,40(sp)
     40a:	7402                	ld	s0,32(sp)
     40c:	64e2                	ld	s1,24(sp)
     40e:	6942                	ld	s2,16(sp)
     410:	69a2                	ld	s3,8(sp)
     412:	6145                	addi	sp,sp,48
     414:	8082                	ret

0000000000000416 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     416:	1101                	addi	sp,sp,-32
     418:	ec06                	sd	ra,24(sp)
     41a:	e822                	sd	s0,16(sp)
     41c:	e426                	sd	s1,8(sp)
     41e:	e04a                	sd	s2,0(sp)
     420:	1000                	addi	s0,sp,32
     422:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     424:	4541                	li	a0,16
     426:	5cd000ef          	jal	ra,11f2 <malloc>
     42a:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     42c:	4641                	li	a2,16
     42e:	4581                	li	a1,0
     430:	70e000ef          	jal	ra,b3e <memset>
  cmd->type = BACK;
     434:	4795                	li	a5,5
     436:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     438:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     43c:	8526                	mv	a0,s1
     43e:	60e2                	ld	ra,24(sp)
     440:	6442                	ld	s0,16(sp)
     442:	64a2                	ld	s1,8(sp)
     444:	6902                	ld	s2,0(sp)
     446:	6105                	addi	sp,sp,32
     448:	8082                	ret

000000000000044a <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     44a:	7139                	addi	sp,sp,-64
     44c:	fc06                	sd	ra,56(sp)
     44e:	f822                	sd	s0,48(sp)
     450:	f426                	sd	s1,40(sp)
     452:	f04a                	sd	s2,32(sp)
     454:	ec4e                	sd	s3,24(sp)
     456:	e852                	sd	s4,16(sp)
     458:	e456                	sd	s5,8(sp)
     45a:	e05a                	sd	s6,0(sp)
     45c:	0080                	addi	s0,sp,64
     45e:	8a2a                	mv	s4,a0
     460:	892e                	mv	s2,a1
     462:	8ab2                	mv	s5,a2
     464:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     466:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     468:	00002997          	auipc	s3,0x2
     46c:	ba098993          	addi	s3,s3,-1120 # 2008 <whitespace>
     470:	00b4fb63          	bgeu	s1,a1,486 <gettoken+0x3c>
     474:	0004c583          	lbu	a1,0(s1)
     478:	854e                	mv	a0,s3
     47a:	6e6000ef          	jal	ra,b60 <strchr>
     47e:	c501                	beqz	a0,486 <gettoken+0x3c>
    s++;
     480:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     482:	fe9919e3          	bne	s2,s1,474 <gettoken+0x2a>
  if(q)
     486:	000a8463          	beqz	s5,48e <gettoken+0x44>
    *q = s;
     48a:	009ab023          	sd	s1,0(s5)
  ret = *s;
     48e:	0004c783          	lbu	a5,0(s1)
     492:	00078a9b          	sext.w	s5,a5
  switch(*s){
     496:	03c00713          	li	a4,60
     49a:	06f76363          	bltu	a4,a5,500 <gettoken+0xb6>
     49e:	03a00713          	li	a4,58
     4a2:	00f76e63          	bltu	a4,a5,4be <gettoken+0x74>
     4a6:	cf89                	beqz	a5,4c0 <gettoken+0x76>
     4a8:	02600713          	li	a4,38
     4ac:	00e78963          	beq	a5,a4,4be <gettoken+0x74>
     4b0:	fd87879b          	addiw	a5,a5,-40
     4b4:	0ff7f793          	andi	a5,a5,255
     4b8:	4705                	li	a4,1
     4ba:	06f76a63          	bltu	a4,a5,52e <gettoken+0xe4>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     4be:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4c0:	000b0463          	beqz	s6,4c8 <gettoken+0x7e>
    *eq = s;
     4c4:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     4c8:	00002997          	auipc	s3,0x2
     4cc:	b4098993          	addi	s3,s3,-1216 # 2008 <whitespace>
     4d0:	0124fb63          	bgeu	s1,s2,4e6 <gettoken+0x9c>
     4d4:	0004c583          	lbu	a1,0(s1)
     4d8:	854e                	mv	a0,s3
     4da:	686000ef          	jal	ra,b60 <strchr>
     4de:	c501                	beqz	a0,4e6 <gettoken+0x9c>
    s++;
     4e0:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     4e2:	fe9919e3          	bne	s2,s1,4d4 <gettoken+0x8a>
  *ps = s;
     4e6:	009a3023          	sd	s1,0(s4)
  return ret;
}
     4ea:	8556                	mv	a0,s5
     4ec:	70e2                	ld	ra,56(sp)
     4ee:	7442                	ld	s0,48(sp)
     4f0:	74a2                	ld	s1,40(sp)
     4f2:	7902                	ld	s2,32(sp)
     4f4:	69e2                	ld	s3,24(sp)
     4f6:	6a42                	ld	s4,16(sp)
     4f8:	6aa2                	ld	s5,8(sp)
     4fa:	6b02                	ld	s6,0(sp)
     4fc:	6121                	addi	sp,sp,64
     4fe:	8082                	ret
  switch(*s){
     500:	03e00713          	li	a4,62
     504:	02e79163          	bne	a5,a4,526 <gettoken+0xdc>
    s++;
     508:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     50c:	0014c703          	lbu	a4,1(s1)
     510:	03e00793          	li	a5,62
      s++;
     514:	0489                	addi	s1,s1,2
      ret = '+';
     516:	02b00a93          	li	s5,43
    if(*s == '>'){
     51a:	faf703e3          	beq	a4,a5,4c0 <gettoken+0x76>
    s++;
     51e:	84b6                	mv	s1,a3
  ret = *s;
     520:	03e00a93          	li	s5,62
     524:	bf71                	j	4c0 <gettoken+0x76>
  switch(*s){
     526:	07c00713          	li	a4,124
     52a:	f8e78ae3          	beq	a5,a4,4be <gettoken+0x74>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     52e:	00002997          	auipc	s3,0x2
     532:	ada98993          	addi	s3,s3,-1318 # 2008 <whitespace>
     536:	00002a97          	auipc	s5,0x2
     53a:	acaa8a93          	addi	s5,s5,-1334 # 2000 <symbols>
     53e:	0324f163          	bgeu	s1,s2,560 <gettoken+0x116>
     542:	0004c583          	lbu	a1,0(s1)
     546:	854e                	mv	a0,s3
     548:	618000ef          	jal	ra,b60 <strchr>
     54c:	e115                	bnez	a0,570 <gettoken+0x126>
     54e:	0004c583          	lbu	a1,0(s1)
     552:	8556                	mv	a0,s5
     554:	60c000ef          	jal	ra,b60 <strchr>
     558:	e909                	bnez	a0,56a <gettoken+0x120>
      s++;
     55a:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     55c:	fe9913e3          	bne	s2,s1,542 <gettoken+0xf8>
  if(eq)
     560:	06100a93          	li	s5,97
     564:	f60b10e3          	bnez	s6,4c4 <gettoken+0x7a>
     568:	bfbd                	j	4e6 <gettoken+0x9c>
    ret = 'a';
     56a:	06100a93          	li	s5,97
     56e:	bf89                	j	4c0 <gettoken+0x76>
     570:	06100a93          	li	s5,97
     574:	b7b1                	j	4c0 <gettoken+0x76>

0000000000000576 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     576:	7139                	addi	sp,sp,-64
     578:	fc06                	sd	ra,56(sp)
     57a:	f822                	sd	s0,48(sp)
     57c:	f426                	sd	s1,40(sp)
     57e:	f04a                	sd	s2,32(sp)
     580:	ec4e                	sd	s3,24(sp)
     582:	e852                	sd	s4,16(sp)
     584:	e456                	sd	s5,8(sp)
     586:	0080                	addi	s0,sp,64
     588:	8a2a                	mv	s4,a0
     58a:	892e                	mv	s2,a1
     58c:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     58e:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     590:	00002997          	auipc	s3,0x2
     594:	a7898993          	addi	s3,s3,-1416 # 2008 <whitespace>
     598:	00b4fb63          	bgeu	s1,a1,5ae <peek+0x38>
     59c:	0004c583          	lbu	a1,0(s1)
     5a0:	854e                	mv	a0,s3
     5a2:	5be000ef          	jal	ra,b60 <strchr>
     5a6:	c501                	beqz	a0,5ae <peek+0x38>
    s++;
     5a8:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     5aa:	fe9919e3          	bne	s2,s1,59c <peek+0x26>
  *ps = s;
     5ae:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     5b2:	0004c583          	lbu	a1,0(s1)
     5b6:	4501                	li	a0,0
     5b8:	e991                	bnez	a1,5cc <peek+0x56>
}
     5ba:	70e2                	ld	ra,56(sp)
     5bc:	7442                	ld	s0,48(sp)
     5be:	74a2                	ld	s1,40(sp)
     5c0:	7902                	ld	s2,32(sp)
     5c2:	69e2                	ld	s3,24(sp)
     5c4:	6a42                	ld	s4,16(sp)
     5c6:	6aa2                	ld	s5,8(sp)
     5c8:	6121                	addi	sp,sp,64
     5ca:	8082                	ret
  return *s && strchr(toks, *s);
     5cc:	8556                	mv	a0,s5
     5ce:	592000ef          	jal	ra,b60 <strchr>
     5d2:	00a03533          	snez	a0,a0
     5d6:	b7d5                	j	5ba <peek+0x44>

00000000000005d8 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5d8:	7159                	addi	sp,sp,-112
     5da:	f486                	sd	ra,104(sp)
     5dc:	f0a2                	sd	s0,96(sp)
     5de:	eca6                	sd	s1,88(sp)
     5e0:	e8ca                	sd	s2,80(sp)
     5e2:	e4ce                	sd	s3,72(sp)
     5e4:	e0d2                	sd	s4,64(sp)
     5e6:	fc56                	sd	s5,56(sp)
     5e8:	f85a                	sd	s6,48(sp)
     5ea:	f45e                	sd	s7,40(sp)
     5ec:	f062                	sd	s8,32(sp)
     5ee:	ec66                	sd	s9,24(sp)
     5f0:	1880                	addi	s0,sp,112
     5f2:	8a2a                	mv	s4,a0
     5f4:	89ae                	mv	s3,a1
     5f6:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     5f8:	00001b97          	auipc	s7,0x1
     5fc:	d80b8b93          	addi	s7,s7,-640 # 1378 <malloc+0x186>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     600:	06100c13          	li	s8,97
      panic("missing file for redirection");
    switch(tok){
     604:	03c00c93          	li	s9,60
  while(peek(ps, es, "<>")){
     608:	a00d                	j	62a <parseredirs+0x52>
      panic("missing file for redirection");
     60a:	00001517          	auipc	a0,0x1
     60e:	d4e50513          	addi	a0,a0,-690 # 1358 <malloc+0x166>
     612:	a39ff0ef          	jal	ra,4a <panic>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     616:	4701                	li	a4,0
     618:	4681                	li	a3,0
     61a:	f9043603          	ld	a2,-112(s0)
     61e:	f9843583          	ld	a1,-104(s0)
     622:	8552                	mv	a0,s4
     624:	d17ff0ef          	jal	ra,33a <redircmd>
     628:	8a2a                	mv	s4,a0
    switch(tok){
     62a:	03e00b13          	li	s6,62
     62e:	02b00a93          	li	s5,43
  while(peek(ps, es, "<>")){
     632:	865e                	mv	a2,s7
     634:	85ca                	mv	a1,s2
     636:	854e                	mv	a0,s3
     638:	f3fff0ef          	jal	ra,576 <peek>
     63c:	c125                	beqz	a0,69c <parseredirs+0xc4>
    tok = gettoken(ps, es, 0, 0);
     63e:	4681                	li	a3,0
     640:	4601                	li	a2,0
     642:	85ca                	mv	a1,s2
     644:	854e                	mv	a0,s3
     646:	e05ff0ef          	jal	ra,44a <gettoken>
     64a:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     64c:	f9040693          	addi	a3,s0,-112
     650:	f9840613          	addi	a2,s0,-104
     654:	85ca                	mv	a1,s2
     656:	854e                	mv	a0,s3
     658:	df3ff0ef          	jal	ra,44a <gettoken>
     65c:	fb8517e3          	bne	a0,s8,60a <parseredirs+0x32>
    switch(tok){
     660:	fb948be3          	beq	s1,s9,616 <parseredirs+0x3e>
     664:	03648063          	beq	s1,s6,684 <parseredirs+0xac>
     668:	fd5495e3          	bne	s1,s5,632 <parseredirs+0x5a>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     66c:	4705                	li	a4,1
     66e:	20100693          	li	a3,513
     672:	f9043603          	ld	a2,-112(s0)
     676:	f9843583          	ld	a1,-104(s0)
     67a:	8552                	mv	a0,s4
     67c:	cbfff0ef          	jal	ra,33a <redircmd>
     680:	8a2a                	mv	s4,a0
      break;
     682:	b765                	j	62a <parseredirs+0x52>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     684:	4705                	li	a4,1
     686:	60100693          	li	a3,1537
     68a:	f9043603          	ld	a2,-112(s0)
     68e:	f9843583          	ld	a1,-104(s0)
     692:	8552                	mv	a0,s4
     694:	ca7ff0ef          	jal	ra,33a <redircmd>
     698:	8a2a                	mv	s4,a0
      break;
     69a:	bf41                	j	62a <parseredirs+0x52>
    }
  }
  return cmd;
}
     69c:	8552                	mv	a0,s4
     69e:	70a6                	ld	ra,104(sp)
     6a0:	7406                	ld	s0,96(sp)
     6a2:	64e6                	ld	s1,88(sp)
     6a4:	6946                	ld	s2,80(sp)
     6a6:	69a6                	ld	s3,72(sp)
     6a8:	6a06                	ld	s4,64(sp)
     6aa:	7ae2                	ld	s5,56(sp)
     6ac:	7b42                	ld	s6,48(sp)
     6ae:	7ba2                	ld	s7,40(sp)
     6b0:	7c02                	ld	s8,32(sp)
     6b2:	6ce2                	ld	s9,24(sp)
     6b4:	6165                	addi	sp,sp,112
     6b6:	8082                	ret

00000000000006b8 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     6b8:	7159                	addi	sp,sp,-112
     6ba:	f486                	sd	ra,104(sp)
     6bc:	f0a2                	sd	s0,96(sp)
     6be:	eca6                	sd	s1,88(sp)
     6c0:	e8ca                	sd	s2,80(sp)
     6c2:	e4ce                	sd	s3,72(sp)
     6c4:	e0d2                	sd	s4,64(sp)
     6c6:	fc56                	sd	s5,56(sp)
     6c8:	f85a                	sd	s6,48(sp)
     6ca:	f45e                	sd	s7,40(sp)
     6cc:	f062                	sd	s8,32(sp)
     6ce:	ec66                	sd	s9,24(sp)
     6d0:	1880                	addi	s0,sp,112
     6d2:	8a2a                	mv	s4,a0
     6d4:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     6d6:	00001617          	auipc	a2,0x1
     6da:	caa60613          	addi	a2,a2,-854 # 1380 <malloc+0x18e>
     6de:	e99ff0ef          	jal	ra,576 <peek>
     6e2:	e505                	bnez	a0,70a <parseexec+0x52>
     6e4:	89aa                	mv	s3,a0
    return parseblock(ps, es);

  ret = execcmd();
     6e6:	c27ff0ef          	jal	ra,30c <execcmd>
     6ea:	8c2a                	mv	s8,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     6ec:	8656                	mv	a2,s5
     6ee:	85d2                	mv	a1,s4
     6f0:	ee9ff0ef          	jal	ra,5d8 <parseredirs>
     6f4:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     6f6:	008c0913          	addi	s2,s8,8
     6fa:	00001b17          	auipc	s6,0x1
     6fe:	ca6b0b13          	addi	s6,s6,-858 # 13a0 <malloc+0x1ae>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
     702:	06100c93          	li	s9,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     706:	4ba9                	li	s7,10
  while(!peek(ps, es, "|)&;")){
     708:	a081                	j	748 <parseexec+0x90>
    return parseblock(ps, es);
     70a:	85d6                	mv	a1,s5
     70c:	8552                	mv	a0,s4
     70e:	170000ef          	jal	ra,87e <parseblock>
     712:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     714:	8526                	mv	a0,s1
     716:	70a6                	ld	ra,104(sp)
     718:	7406                	ld	s0,96(sp)
     71a:	64e6                	ld	s1,88(sp)
     71c:	6946                	ld	s2,80(sp)
     71e:	69a6                	ld	s3,72(sp)
     720:	6a06                	ld	s4,64(sp)
     722:	7ae2                	ld	s5,56(sp)
     724:	7b42                	ld	s6,48(sp)
     726:	7ba2                	ld	s7,40(sp)
     728:	7c02                	ld	s8,32(sp)
     72a:	6ce2                	ld	s9,24(sp)
     72c:	6165                	addi	sp,sp,112
     72e:	8082                	ret
      panic("syntax");
     730:	00001517          	auipc	a0,0x1
     734:	c5850513          	addi	a0,a0,-936 # 1388 <malloc+0x196>
     738:	913ff0ef          	jal	ra,4a <panic>
    ret = parseredirs(ret, ps, es);
     73c:	8656                	mv	a2,s5
     73e:	85d2                	mv	a1,s4
     740:	8526                	mv	a0,s1
     742:	e97ff0ef          	jal	ra,5d8 <parseredirs>
     746:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     748:	865a                	mv	a2,s6
     74a:	85d6                	mv	a1,s5
     74c:	8552                	mv	a0,s4
     74e:	e29ff0ef          	jal	ra,576 <peek>
     752:	ed15                	bnez	a0,78e <parseexec+0xd6>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     754:	f9040693          	addi	a3,s0,-112
     758:	f9840613          	addi	a2,s0,-104
     75c:	85d6                	mv	a1,s5
     75e:	8552                	mv	a0,s4
     760:	cebff0ef          	jal	ra,44a <gettoken>
     764:	c50d                	beqz	a0,78e <parseexec+0xd6>
    if(tok != 'a')
     766:	fd9515e3          	bne	a0,s9,730 <parseexec+0x78>
    cmd->argv[argc] = q;
     76a:	f9843783          	ld	a5,-104(s0)
     76e:	00f93023          	sd	a5,0(s2)
    cmd->eargv[argc] = eq;
     772:	f9043783          	ld	a5,-112(s0)
     776:	04f93823          	sd	a5,80(s2)
    argc++;
     77a:	2985                	addiw	s3,s3,1
    if(argc >= MAXARGS)
     77c:	0921                	addi	s2,s2,8
     77e:	fb799fe3          	bne	s3,s7,73c <parseexec+0x84>
      panic("too many args");
     782:	00001517          	auipc	a0,0x1
     786:	c0e50513          	addi	a0,a0,-1010 # 1390 <malloc+0x19e>
     78a:	8c1ff0ef          	jal	ra,4a <panic>
  cmd->argv[argc] = 0;
     78e:	098e                	slli	s3,s3,0x3
     790:	99e2                	add	s3,s3,s8
     792:	0009b423          	sd	zero,8(s3)
  cmd->eargv[argc] = 0;
     796:	0409bc23          	sd	zero,88(s3)
  return ret;
     79a:	bfad                	j	714 <parseexec+0x5c>

000000000000079c <parsepipe>:
{
     79c:	7179                	addi	sp,sp,-48
     79e:	f406                	sd	ra,40(sp)
     7a0:	f022                	sd	s0,32(sp)
     7a2:	ec26                	sd	s1,24(sp)
     7a4:	e84a                	sd	s2,16(sp)
     7a6:	e44e                	sd	s3,8(sp)
     7a8:	1800                	addi	s0,sp,48
     7aa:	892a                	mv	s2,a0
     7ac:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     7ae:	f0bff0ef          	jal	ra,6b8 <parseexec>
     7b2:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     7b4:	00001617          	auipc	a2,0x1
     7b8:	bf460613          	addi	a2,a2,-1036 # 13a8 <malloc+0x1b6>
     7bc:	85ce                	mv	a1,s3
     7be:	854a                	mv	a0,s2
     7c0:	db7ff0ef          	jal	ra,576 <peek>
     7c4:	e909                	bnez	a0,7d6 <parsepipe+0x3a>
}
     7c6:	8526                	mv	a0,s1
     7c8:	70a2                	ld	ra,40(sp)
     7ca:	7402                	ld	s0,32(sp)
     7cc:	64e2                	ld	s1,24(sp)
     7ce:	6942                	ld	s2,16(sp)
     7d0:	69a2                	ld	s3,8(sp)
     7d2:	6145                	addi	sp,sp,48
     7d4:	8082                	ret
    gettoken(ps, es, 0, 0);
     7d6:	4681                	li	a3,0
     7d8:	4601                	li	a2,0
     7da:	85ce                	mv	a1,s3
     7dc:	854a                	mv	a0,s2
     7de:	c6dff0ef          	jal	ra,44a <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     7e2:	85ce                	mv	a1,s3
     7e4:	854a                	mv	a0,s2
     7e6:	fb7ff0ef          	jal	ra,79c <parsepipe>
     7ea:	85aa                	mv	a1,a0
     7ec:	8526                	mv	a0,s1
     7ee:	badff0ef          	jal	ra,39a <pipecmd>
     7f2:	84aa                	mv	s1,a0
  return cmd;
     7f4:	bfc9                	j	7c6 <parsepipe+0x2a>

00000000000007f6 <parseline>:
{
     7f6:	7179                	addi	sp,sp,-48
     7f8:	f406                	sd	ra,40(sp)
     7fa:	f022                	sd	s0,32(sp)
     7fc:	ec26                	sd	s1,24(sp)
     7fe:	e84a                	sd	s2,16(sp)
     800:	e44e                	sd	s3,8(sp)
     802:	e052                	sd	s4,0(sp)
     804:	1800                	addi	s0,sp,48
     806:	892a                	mv	s2,a0
     808:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     80a:	f93ff0ef          	jal	ra,79c <parsepipe>
     80e:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     810:	00001a17          	auipc	s4,0x1
     814:	ba0a0a13          	addi	s4,s4,-1120 # 13b0 <malloc+0x1be>
     818:	a819                	j	82e <parseline+0x38>
    gettoken(ps, es, 0, 0);
     81a:	4681                	li	a3,0
     81c:	4601                	li	a2,0
     81e:	85ce                	mv	a1,s3
     820:	854a                	mv	a0,s2
     822:	c29ff0ef          	jal	ra,44a <gettoken>
    cmd = backcmd(cmd);
     826:	8526                	mv	a0,s1
     828:	befff0ef          	jal	ra,416 <backcmd>
     82c:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     82e:	8652                	mv	a2,s4
     830:	85ce                	mv	a1,s3
     832:	854a                	mv	a0,s2
     834:	d43ff0ef          	jal	ra,576 <peek>
     838:	f16d                	bnez	a0,81a <parseline+0x24>
  if(peek(ps, es, ";")){
     83a:	00001617          	auipc	a2,0x1
     83e:	b7e60613          	addi	a2,a2,-1154 # 13b8 <malloc+0x1c6>
     842:	85ce                	mv	a1,s3
     844:	854a                	mv	a0,s2
     846:	d31ff0ef          	jal	ra,576 <peek>
     84a:	e911                	bnez	a0,85e <parseline+0x68>
}
     84c:	8526                	mv	a0,s1
     84e:	70a2                	ld	ra,40(sp)
     850:	7402                	ld	s0,32(sp)
     852:	64e2                	ld	s1,24(sp)
     854:	6942                	ld	s2,16(sp)
     856:	69a2                	ld	s3,8(sp)
     858:	6a02                	ld	s4,0(sp)
     85a:	6145                	addi	sp,sp,48
     85c:	8082                	ret
    gettoken(ps, es, 0, 0);
     85e:	4681                	li	a3,0
     860:	4601                	li	a2,0
     862:	85ce                	mv	a1,s3
     864:	854a                	mv	a0,s2
     866:	be5ff0ef          	jal	ra,44a <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     86a:	85ce                	mv	a1,s3
     86c:	854a                	mv	a0,s2
     86e:	f89ff0ef          	jal	ra,7f6 <parseline>
     872:	85aa                	mv	a1,a0
     874:	8526                	mv	a0,s1
     876:	b63ff0ef          	jal	ra,3d8 <listcmd>
     87a:	84aa                	mv	s1,a0
  return cmd;
     87c:	bfc1                	j	84c <parseline+0x56>

000000000000087e <parseblock>:
{
     87e:	7179                	addi	sp,sp,-48
     880:	f406                	sd	ra,40(sp)
     882:	f022                	sd	s0,32(sp)
     884:	ec26                	sd	s1,24(sp)
     886:	e84a                	sd	s2,16(sp)
     888:	e44e                	sd	s3,8(sp)
     88a:	1800                	addi	s0,sp,48
     88c:	84aa                	mv	s1,a0
     88e:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     890:	00001617          	auipc	a2,0x1
     894:	af060613          	addi	a2,a2,-1296 # 1380 <malloc+0x18e>
     898:	cdfff0ef          	jal	ra,576 <peek>
     89c:	c539                	beqz	a0,8ea <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     89e:	4681                	li	a3,0
     8a0:	4601                	li	a2,0
     8a2:	85ca                	mv	a1,s2
     8a4:	8526                	mv	a0,s1
     8a6:	ba5ff0ef          	jal	ra,44a <gettoken>
  cmd = parseline(ps, es);
     8aa:	85ca                	mv	a1,s2
     8ac:	8526                	mv	a0,s1
     8ae:	f49ff0ef          	jal	ra,7f6 <parseline>
     8b2:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     8b4:	00001617          	auipc	a2,0x1
     8b8:	b1c60613          	addi	a2,a2,-1252 # 13d0 <malloc+0x1de>
     8bc:	85ca                	mv	a1,s2
     8be:	8526                	mv	a0,s1
     8c0:	cb7ff0ef          	jal	ra,576 <peek>
     8c4:	c90d                	beqz	a0,8f6 <parseblock+0x78>
  gettoken(ps, es, 0, 0);
     8c6:	4681                	li	a3,0
     8c8:	4601                	li	a2,0
     8ca:	85ca                	mv	a1,s2
     8cc:	8526                	mv	a0,s1
     8ce:	b7dff0ef          	jal	ra,44a <gettoken>
  cmd = parseredirs(cmd, ps, es);
     8d2:	864a                	mv	a2,s2
     8d4:	85a6                	mv	a1,s1
     8d6:	854e                	mv	a0,s3
     8d8:	d01ff0ef          	jal	ra,5d8 <parseredirs>
}
     8dc:	70a2                	ld	ra,40(sp)
     8de:	7402                	ld	s0,32(sp)
     8e0:	64e2                	ld	s1,24(sp)
     8e2:	6942                	ld	s2,16(sp)
     8e4:	69a2                	ld	s3,8(sp)
     8e6:	6145                	addi	sp,sp,48
     8e8:	8082                	ret
    panic("parseblock");
     8ea:	00001517          	auipc	a0,0x1
     8ee:	ad650513          	addi	a0,a0,-1322 # 13c0 <malloc+0x1ce>
     8f2:	f58ff0ef          	jal	ra,4a <panic>
    panic("syntax - missing )");
     8f6:	00001517          	auipc	a0,0x1
     8fa:	ae250513          	addi	a0,a0,-1310 # 13d8 <malloc+0x1e6>
     8fe:	f4cff0ef          	jal	ra,4a <panic>

0000000000000902 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     902:	1101                	addi	sp,sp,-32
     904:	ec06                	sd	ra,24(sp)
     906:	e822                	sd	s0,16(sp)
     908:	e426                	sd	s1,8(sp)
     90a:	1000                	addi	s0,sp,32
     90c:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     90e:	c131                	beqz	a0,952 <nulterminate+0x50>
    return 0;

  switch(cmd->type){
     910:	4118                	lw	a4,0(a0)
     912:	4795                	li	a5,5
     914:	02e7ef63          	bltu	a5,a4,952 <nulterminate+0x50>
     918:	00056783          	lwu	a5,0(a0)
     91c:	078a                	slli	a5,a5,0x2
     91e:	00001717          	auipc	a4,0x1
     922:	b1a70713          	addi	a4,a4,-1254 # 1438 <malloc+0x246>
     926:	97ba                	add	a5,a5,a4
     928:	439c                	lw	a5,0(a5)
     92a:	97ba                	add	a5,a5,a4
     92c:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     92e:	651c                	ld	a5,8(a0)
     930:	c38d                	beqz	a5,952 <nulterminate+0x50>
     932:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     936:	67b8                	ld	a4,72(a5)
     938:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     93c:	07a1                	addi	a5,a5,8
     93e:	ff87b703          	ld	a4,-8(a5)
     942:	fb75                	bnez	a4,936 <nulterminate+0x34>
     944:	a039                	j	952 <nulterminate+0x50>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     946:	6508                	ld	a0,8(a0)
     948:	fbbff0ef          	jal	ra,902 <nulterminate>
    *rcmd->efile = 0;
     94c:	6c9c                	ld	a5,24(s1)
     94e:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     952:	8526                	mv	a0,s1
     954:	60e2                	ld	ra,24(sp)
     956:	6442                	ld	s0,16(sp)
     958:	64a2                	ld	s1,8(sp)
     95a:	6105                	addi	sp,sp,32
     95c:	8082                	ret
    nulterminate(pcmd->left);
     95e:	6508                	ld	a0,8(a0)
     960:	fa3ff0ef          	jal	ra,902 <nulterminate>
    nulterminate(pcmd->right);
     964:	6888                	ld	a0,16(s1)
     966:	f9dff0ef          	jal	ra,902 <nulterminate>
    break;
     96a:	b7e5                	j	952 <nulterminate+0x50>
    nulterminate(lcmd->left);
     96c:	6508                	ld	a0,8(a0)
     96e:	f95ff0ef          	jal	ra,902 <nulterminate>
    nulterminate(lcmd->right);
     972:	6888                	ld	a0,16(s1)
     974:	f8fff0ef          	jal	ra,902 <nulterminate>
    break;
     978:	bfe9                	j	952 <nulterminate+0x50>
    nulterminate(bcmd->cmd);
     97a:	6508                	ld	a0,8(a0)
     97c:	f87ff0ef          	jal	ra,902 <nulterminate>
    break;
     980:	bfc9                	j	952 <nulterminate+0x50>

0000000000000982 <parsecmd>:
{
     982:	7179                	addi	sp,sp,-48
     984:	f406                	sd	ra,40(sp)
     986:	f022                	sd	s0,32(sp)
     988:	ec26                	sd	s1,24(sp)
     98a:	e84a                	sd	s2,16(sp)
     98c:	1800                	addi	s0,sp,48
     98e:	fca43c23          	sd	a0,-40(s0)
  es = s + strlen(s);
     992:	84aa                	mv	s1,a0
     994:	180000ef          	jal	ra,b14 <strlen>
     998:	1502                	slli	a0,a0,0x20
     99a:	9101                	srli	a0,a0,0x20
     99c:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     99e:	85a6                	mv	a1,s1
     9a0:	fd840513          	addi	a0,s0,-40
     9a4:	e53ff0ef          	jal	ra,7f6 <parseline>
     9a8:	892a                	mv	s2,a0
  peek(&s, es, "");
     9aa:	00001617          	auipc	a2,0x1
     9ae:	a4660613          	addi	a2,a2,-1466 # 13f0 <malloc+0x1fe>
     9b2:	85a6                	mv	a1,s1
     9b4:	fd840513          	addi	a0,s0,-40
     9b8:	bbfff0ef          	jal	ra,576 <peek>
  if(s != es){
     9bc:	fd843603          	ld	a2,-40(s0)
     9c0:	00961c63          	bne	a2,s1,9d8 <parsecmd+0x56>
  nulterminate(cmd);
     9c4:	854a                	mv	a0,s2
     9c6:	f3dff0ef          	jal	ra,902 <nulterminate>
}
     9ca:	854a                	mv	a0,s2
     9cc:	70a2                	ld	ra,40(sp)
     9ce:	7402                	ld	s0,32(sp)
     9d0:	64e2                	ld	s1,24(sp)
     9d2:	6942                	ld	s2,16(sp)
     9d4:	6145                	addi	sp,sp,48
     9d6:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     9d8:	00001597          	auipc	a1,0x1
     9dc:	a2058593          	addi	a1,a1,-1504 # 13f8 <malloc+0x206>
     9e0:	4509                	li	a0,2
     9e2:	72c000ef          	jal	ra,110e <fprintf>
    panic("syntax");
     9e6:	00001517          	auipc	a0,0x1
     9ea:	9a250513          	addi	a0,a0,-1630 # 1388 <malloc+0x196>
     9ee:	e5cff0ef          	jal	ra,4a <panic>

00000000000009f2 <main>:
{
     9f2:	7139                	addi	sp,sp,-64
     9f4:	fc06                	sd	ra,56(sp)
     9f6:	f822                	sd	s0,48(sp)
     9f8:	f426                	sd	s1,40(sp)
     9fa:	f04a                	sd	s2,32(sp)
     9fc:	ec4e                	sd	s3,24(sp)
     9fe:	e852                	sd	s4,16(sp)
     a00:	e456                	sd	s5,8(sp)
     a02:	0080                	addi	s0,sp,64
  while((fd = open("console", O_RDWR)) >= 0){
     a04:	00001497          	auipc	s1,0x1
     a08:	a0448493          	addi	s1,s1,-1532 # 1408 <malloc+0x216>
     a0c:	4589                	li	a1,2
     a0e:	8526                	mv	a0,s1
     a10:	356000ef          	jal	ra,d66 <open>
     a14:	00054763          	bltz	a0,a22 <main+0x30>
    if(fd >= 3){
     a18:	4789                	li	a5,2
     a1a:	fea7d9e3          	bge	a5,a0,a0c <main+0x1a>
      close(fd);
     a1e:	330000ef          	jal	ra,d4e <close>
  while(getcmd(buf, sizeof(buf)) >= 0){
     a22:	00001497          	auipc	s1,0x1
     a26:	5fe48493          	addi	s1,s1,1534 # 2020 <buf.0>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     a2a:	06300913          	li	s2,99
     a2e:	02000993          	li	s3,32
      if(chdir(buf+3) < 0)
     a32:	00001a17          	auipc	s4,0x1
     a36:	5f1a0a13          	addi	s4,s4,1521 # 2023 <buf.0+0x3>
        fprintf(2, "cannot cd %s\n", buf+3);
     a3a:	00001a97          	auipc	s5,0x1
     a3e:	9d6a8a93          	addi	s5,s5,-1578 # 1410 <malloc+0x21e>
     a42:	a039                	j	a50 <main+0x5e>
    if(fork1() == 0)
     a44:	e24ff0ef          	jal	ra,68 <fork1>
     a48:	cd31                	beqz	a0,aa4 <main+0xb2>
    wait(0);
     a4a:	4501                	li	a0,0
     a4c:	2e2000ef          	jal	ra,d2e <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     a50:	06400593          	li	a1,100
     a54:	8526                	mv	a0,s1
     a56:	daaff0ef          	jal	ra,0 <getcmd>
     a5a:	04054d63          	bltz	a0,ab4 <main+0xc2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     a5e:	0004c783          	lbu	a5,0(s1)
     a62:	ff2791e3          	bne	a5,s2,a44 <main+0x52>
     a66:	0014c703          	lbu	a4,1(s1)
     a6a:	06400793          	li	a5,100
     a6e:	fcf71be3          	bne	a4,a5,a44 <main+0x52>
     a72:	0024c783          	lbu	a5,2(s1)
     a76:	fd3797e3          	bne	a5,s3,a44 <main+0x52>
      buf[strlen(buf)-1] = 0;  // chop \n
     a7a:	8526                	mv	a0,s1
     a7c:	098000ef          	jal	ra,b14 <strlen>
     a80:	fff5079b          	addiw	a5,a0,-1
     a84:	1782                	slli	a5,a5,0x20
     a86:	9381                	srli	a5,a5,0x20
     a88:	97a6                	add	a5,a5,s1
     a8a:	00078023          	sb	zero,0(a5)
      if(chdir(buf+3) < 0)
     a8e:	8552                	mv	a0,s4
     a90:	306000ef          	jal	ra,d96 <chdir>
     a94:	fa055ee3          	bgez	a0,a50 <main+0x5e>
        fprintf(2, "cannot cd %s\n", buf+3);
     a98:	8652                	mv	a2,s4
     a9a:	85d6                	mv	a1,s5
     a9c:	4509                	li	a0,2
     a9e:	670000ef          	jal	ra,110e <fprintf>
     aa2:	b77d                	j	a50 <main+0x5e>
      runcmd(parsecmd(buf));
     aa4:	00001517          	auipc	a0,0x1
     aa8:	57c50513          	addi	a0,a0,1404 # 2020 <buf.0>
     aac:	ed7ff0ef          	jal	ra,982 <parsecmd>
     ab0:	ddeff0ef          	jal	ra,8e <runcmd>
  exit(0);
     ab4:	4501                	li	a0,0
     ab6:	270000ef          	jal	ra,d26 <exit>

0000000000000aba <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start()
{
     aba:	1141                	addi	sp,sp,-16
     abc:	e406                	sd	ra,8(sp)
     abe:	e022                	sd	s0,0(sp)
     ac0:	0800                	addi	s0,sp,16
  extern int main();
  main();
     ac2:	f31ff0ef          	jal	ra,9f2 <main>
  exit(0);
     ac6:	4501                	li	a0,0
     ac8:	25e000ef          	jal	ra,d26 <exit>

0000000000000acc <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     acc:	1141                	addi	sp,sp,-16
     ace:	e422                	sd	s0,8(sp)
     ad0:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     ad2:	87aa                	mv	a5,a0
     ad4:	0585                	addi	a1,a1,1
     ad6:	0785                	addi	a5,a5,1
     ad8:	fff5c703          	lbu	a4,-1(a1)
     adc:	fee78fa3          	sb	a4,-1(a5)
     ae0:	fb75                	bnez	a4,ad4 <strcpy+0x8>
    ;
  return os;
}
     ae2:	6422                	ld	s0,8(sp)
     ae4:	0141                	addi	sp,sp,16
     ae6:	8082                	ret

0000000000000ae8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ae8:	1141                	addi	sp,sp,-16
     aea:	e422                	sd	s0,8(sp)
     aec:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     aee:	00054783          	lbu	a5,0(a0)
     af2:	cb91                	beqz	a5,b06 <strcmp+0x1e>
     af4:	0005c703          	lbu	a4,0(a1)
     af8:	00f71763          	bne	a4,a5,b06 <strcmp+0x1e>
    p++, q++;
     afc:	0505                	addi	a0,a0,1
     afe:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     b00:	00054783          	lbu	a5,0(a0)
     b04:	fbe5                	bnez	a5,af4 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     b06:	0005c503          	lbu	a0,0(a1)
}
     b0a:	40a7853b          	subw	a0,a5,a0
     b0e:	6422                	ld	s0,8(sp)
     b10:	0141                	addi	sp,sp,16
     b12:	8082                	ret

0000000000000b14 <strlen>:

uint
strlen(const char *s)
{
     b14:	1141                	addi	sp,sp,-16
     b16:	e422                	sd	s0,8(sp)
     b18:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     b1a:	00054783          	lbu	a5,0(a0)
     b1e:	cf91                	beqz	a5,b3a <strlen+0x26>
     b20:	0505                	addi	a0,a0,1
     b22:	87aa                	mv	a5,a0
     b24:	4685                	li	a3,1
     b26:	9e89                	subw	a3,a3,a0
     b28:	00f6853b          	addw	a0,a3,a5
     b2c:	0785                	addi	a5,a5,1
     b2e:	fff7c703          	lbu	a4,-1(a5)
     b32:	fb7d                	bnez	a4,b28 <strlen+0x14>
    ;
  return n;
}
     b34:	6422                	ld	s0,8(sp)
     b36:	0141                	addi	sp,sp,16
     b38:	8082                	ret
  for(n = 0; s[n]; n++)
     b3a:	4501                	li	a0,0
     b3c:	bfe5                	j	b34 <strlen+0x20>

0000000000000b3e <memset>:

void*
memset(void *dst, int c, uint n)
{
     b3e:	1141                	addi	sp,sp,-16
     b40:	e422                	sd	s0,8(sp)
     b42:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     b44:	ca19                	beqz	a2,b5a <memset+0x1c>
     b46:	87aa                	mv	a5,a0
     b48:	1602                	slli	a2,a2,0x20
     b4a:	9201                	srli	a2,a2,0x20
     b4c:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     b50:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     b54:	0785                	addi	a5,a5,1
     b56:	fee79de3          	bne	a5,a4,b50 <memset+0x12>
  }
  return dst;
}
     b5a:	6422                	ld	s0,8(sp)
     b5c:	0141                	addi	sp,sp,16
     b5e:	8082                	ret

0000000000000b60 <strchr>:

char*
strchr(const char *s, char c)
{
     b60:	1141                	addi	sp,sp,-16
     b62:	e422                	sd	s0,8(sp)
     b64:	0800                	addi	s0,sp,16
  for(; *s; s++)
     b66:	00054783          	lbu	a5,0(a0)
     b6a:	cb99                	beqz	a5,b80 <strchr+0x20>
    if(*s == c)
     b6c:	00f58763          	beq	a1,a5,b7a <strchr+0x1a>
  for(; *s; s++)
     b70:	0505                	addi	a0,a0,1
     b72:	00054783          	lbu	a5,0(a0)
     b76:	fbfd                	bnez	a5,b6c <strchr+0xc>
      return (char*)s;
  return 0;
     b78:	4501                	li	a0,0
}
     b7a:	6422                	ld	s0,8(sp)
     b7c:	0141                	addi	sp,sp,16
     b7e:	8082                	ret
  return 0;
     b80:	4501                	li	a0,0
     b82:	bfe5                	j	b7a <strchr+0x1a>

0000000000000b84 <gets>:

char*
gets(char *buf, int max)
{
     b84:	711d                	addi	sp,sp,-96
     b86:	ec86                	sd	ra,88(sp)
     b88:	e8a2                	sd	s0,80(sp)
     b8a:	e4a6                	sd	s1,72(sp)
     b8c:	e0ca                	sd	s2,64(sp)
     b8e:	fc4e                	sd	s3,56(sp)
     b90:	f852                	sd	s4,48(sp)
     b92:	f456                	sd	s5,40(sp)
     b94:	f05a                	sd	s6,32(sp)
     b96:	ec5e                	sd	s7,24(sp)
     b98:	1080                	addi	s0,sp,96
     b9a:	8baa                	mv	s7,a0
     b9c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b9e:	892a                	mv	s2,a0
     ba0:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     ba2:	4aa9                	li	s5,10
     ba4:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
     ba6:	89a6                	mv	s3,s1
     ba8:	2485                	addiw	s1,s1,1
     baa:	0344d663          	bge	s1,s4,bd6 <gets+0x52>
    cc = read(0, &c, 1);
     bae:	4605                	li	a2,1
     bb0:	faf40593          	addi	a1,s0,-81
     bb4:	4501                	li	a0,0
     bb6:	188000ef          	jal	ra,d3e <read>
    if(cc < 1)
     bba:	00a05e63          	blez	a0,bd6 <gets+0x52>
    buf[i++] = c;
     bbe:	faf44783          	lbu	a5,-81(s0)
     bc2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     bc6:	01578763          	beq	a5,s5,bd4 <gets+0x50>
     bca:	0905                	addi	s2,s2,1
     bcc:	fd679de3          	bne	a5,s6,ba6 <gets+0x22>
  for(i=0; i+1 < max; ){
     bd0:	89a6                	mv	s3,s1
     bd2:	a011                	j	bd6 <gets+0x52>
     bd4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
     bd6:	99de                	add	s3,s3,s7
     bd8:	00098023          	sb	zero,0(s3)
  return buf;
}
     bdc:	855e                	mv	a0,s7
     bde:	60e6                	ld	ra,88(sp)
     be0:	6446                	ld	s0,80(sp)
     be2:	64a6                	ld	s1,72(sp)
     be4:	6906                	ld	s2,64(sp)
     be6:	79e2                	ld	s3,56(sp)
     be8:	7a42                	ld	s4,48(sp)
     bea:	7aa2                	ld	s5,40(sp)
     bec:	7b02                	ld	s6,32(sp)
     bee:	6be2                	ld	s7,24(sp)
     bf0:	6125                	addi	sp,sp,96
     bf2:	8082                	ret

0000000000000bf4 <stat>:

int
stat(const char *n, struct stat *st)
{
     bf4:	1101                	addi	sp,sp,-32
     bf6:	ec06                	sd	ra,24(sp)
     bf8:	e822                	sd	s0,16(sp)
     bfa:	e426                	sd	s1,8(sp)
     bfc:	e04a                	sd	s2,0(sp)
     bfe:	1000                	addi	s0,sp,32
     c00:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c02:	4581                	li	a1,0
     c04:	162000ef          	jal	ra,d66 <open>
  if(fd < 0)
     c08:	02054163          	bltz	a0,c2a <stat+0x36>
     c0c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     c0e:	85ca                	mv	a1,s2
     c10:	16e000ef          	jal	ra,d7e <fstat>
     c14:	892a                	mv	s2,a0
  close(fd);
     c16:	8526                	mv	a0,s1
     c18:	136000ef          	jal	ra,d4e <close>
  return r;
}
     c1c:	854a                	mv	a0,s2
     c1e:	60e2                	ld	ra,24(sp)
     c20:	6442                	ld	s0,16(sp)
     c22:	64a2                	ld	s1,8(sp)
     c24:	6902                	ld	s2,0(sp)
     c26:	6105                	addi	sp,sp,32
     c28:	8082                	ret
    return -1;
     c2a:	597d                	li	s2,-1
     c2c:	bfc5                	j	c1c <stat+0x28>

0000000000000c2e <atoi>:

int
atoi(const char *s)
{
     c2e:	1141                	addi	sp,sp,-16
     c30:	e422                	sd	s0,8(sp)
     c32:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c34:	00054603          	lbu	a2,0(a0)
     c38:	fd06079b          	addiw	a5,a2,-48
     c3c:	0ff7f793          	andi	a5,a5,255
     c40:	4725                	li	a4,9
     c42:	02f76963          	bltu	a4,a5,c74 <atoi+0x46>
     c46:	86aa                	mv	a3,a0
  n = 0;
     c48:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
     c4a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
     c4c:	0685                	addi	a3,a3,1
     c4e:	0025179b          	slliw	a5,a0,0x2
     c52:	9fa9                	addw	a5,a5,a0
     c54:	0017979b          	slliw	a5,a5,0x1
     c58:	9fb1                	addw	a5,a5,a2
     c5a:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     c5e:	0006c603          	lbu	a2,0(a3)
     c62:	fd06071b          	addiw	a4,a2,-48
     c66:	0ff77713          	andi	a4,a4,255
     c6a:	fee5f1e3          	bgeu	a1,a4,c4c <atoi+0x1e>
  return n;
}
     c6e:	6422                	ld	s0,8(sp)
     c70:	0141                	addi	sp,sp,16
     c72:	8082                	ret
  n = 0;
     c74:	4501                	li	a0,0
     c76:	bfe5                	j	c6e <atoi+0x40>

0000000000000c78 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     c78:	1141                	addi	sp,sp,-16
     c7a:	e422                	sd	s0,8(sp)
     c7c:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     c7e:	02b57463          	bgeu	a0,a1,ca6 <memmove+0x2e>
    while(n-- > 0)
     c82:	00c05f63          	blez	a2,ca0 <memmove+0x28>
     c86:	1602                	slli	a2,a2,0x20
     c88:	9201                	srli	a2,a2,0x20
     c8a:	00c507b3          	add	a5,a0,a2
  dst = vdst;
     c8e:	872a                	mv	a4,a0
      *dst++ = *src++;
     c90:	0585                	addi	a1,a1,1
     c92:	0705                	addi	a4,a4,1
     c94:	fff5c683          	lbu	a3,-1(a1)
     c98:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
     c9c:	fee79ae3          	bne	a5,a4,c90 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
     ca0:	6422                	ld	s0,8(sp)
     ca2:	0141                	addi	sp,sp,16
     ca4:	8082                	ret
    dst += n;
     ca6:	00c50733          	add	a4,a0,a2
    src += n;
     caa:	95b2                	add	a1,a1,a2
    while(n-- > 0)
     cac:	fec05ae3          	blez	a2,ca0 <memmove+0x28>
     cb0:	fff6079b          	addiw	a5,a2,-1
     cb4:	1782                	slli	a5,a5,0x20
     cb6:	9381                	srli	a5,a5,0x20
     cb8:	fff7c793          	not	a5,a5
     cbc:	97ba                	add	a5,a5,a4
      *--dst = *--src;
     cbe:	15fd                	addi	a1,a1,-1
     cc0:	177d                	addi	a4,a4,-1
     cc2:	0005c683          	lbu	a3,0(a1)
     cc6:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
     cca:	fee79ae3          	bne	a5,a4,cbe <memmove+0x46>
     cce:	bfc9                	j	ca0 <memmove+0x28>

0000000000000cd0 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     cd0:	1141                	addi	sp,sp,-16
     cd2:	e422                	sd	s0,8(sp)
     cd4:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
     cd6:	ca05                	beqz	a2,d06 <memcmp+0x36>
     cd8:	fff6069b          	addiw	a3,a2,-1
     cdc:	1682                	slli	a3,a3,0x20
     cde:	9281                	srli	a3,a3,0x20
     ce0:	0685                	addi	a3,a3,1
     ce2:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
     ce4:	00054783          	lbu	a5,0(a0)
     ce8:	0005c703          	lbu	a4,0(a1)
     cec:	00e79863          	bne	a5,a4,cfc <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
     cf0:	0505                	addi	a0,a0,1
    p2++;
     cf2:	0585                	addi	a1,a1,1
  while (n-- > 0) {
     cf4:	fed518e3          	bne	a0,a3,ce4 <memcmp+0x14>
  }
  return 0;
     cf8:	4501                	li	a0,0
     cfa:	a019                	j	d00 <memcmp+0x30>
      return *p1 - *p2;
     cfc:	40e7853b          	subw	a0,a5,a4
}
     d00:	6422                	ld	s0,8(sp)
     d02:	0141                	addi	sp,sp,16
     d04:	8082                	ret
  return 0;
     d06:	4501                	li	a0,0
     d08:	bfe5                	j	d00 <memcmp+0x30>

0000000000000d0a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     d0a:	1141                	addi	sp,sp,-16
     d0c:	e406                	sd	ra,8(sp)
     d0e:	e022                	sd	s0,0(sp)
     d10:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
     d12:	f67ff0ef          	jal	ra,c78 <memmove>
}
     d16:	60a2                	ld	ra,8(sp)
     d18:	6402                	ld	s0,0(sp)
     d1a:	0141                	addi	sp,sp,16
     d1c:	8082                	ret

0000000000000d1e <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     d1e:	4885                	li	a7,1
 ecall
     d20:	00000073          	ecall
 ret
     d24:	8082                	ret

0000000000000d26 <exit>:
.global exit
exit:
 li a7, SYS_exit
     d26:	4889                	li	a7,2
 ecall
     d28:	00000073          	ecall
 ret
     d2c:	8082                	ret

0000000000000d2e <wait>:
.global wait
wait:
 li a7, SYS_wait
     d2e:	488d                	li	a7,3
 ecall
     d30:	00000073          	ecall
 ret
     d34:	8082                	ret

0000000000000d36 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     d36:	4891                	li	a7,4
 ecall
     d38:	00000073          	ecall
 ret
     d3c:	8082                	ret

0000000000000d3e <read>:
.global read
read:
 li a7, SYS_read
     d3e:	4895                	li	a7,5
 ecall
     d40:	00000073          	ecall
 ret
     d44:	8082                	ret

0000000000000d46 <write>:
.global write
write:
 li a7, SYS_write
     d46:	48c1                	li	a7,16
 ecall
     d48:	00000073          	ecall
 ret
     d4c:	8082                	ret

0000000000000d4e <close>:
.global close
close:
 li a7, SYS_close
     d4e:	48d5                	li	a7,21
 ecall
     d50:	00000073          	ecall
 ret
     d54:	8082                	ret

0000000000000d56 <kill>:
.global kill
kill:
 li a7, SYS_kill
     d56:	4899                	li	a7,6
 ecall
     d58:	00000073          	ecall
 ret
     d5c:	8082                	ret

0000000000000d5e <exec>:
.global exec
exec:
 li a7, SYS_exec
     d5e:	489d                	li	a7,7
 ecall
     d60:	00000073          	ecall
 ret
     d64:	8082                	ret

0000000000000d66 <open>:
.global open
open:
 li a7, SYS_open
     d66:	48bd                	li	a7,15
 ecall
     d68:	00000073          	ecall
 ret
     d6c:	8082                	ret

0000000000000d6e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     d6e:	48c5                	li	a7,17
 ecall
     d70:	00000073          	ecall
 ret
     d74:	8082                	ret

0000000000000d76 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     d76:	48c9                	li	a7,18
 ecall
     d78:	00000073          	ecall
 ret
     d7c:	8082                	ret

0000000000000d7e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     d7e:	48a1                	li	a7,8
 ecall
     d80:	00000073          	ecall
 ret
     d84:	8082                	ret

0000000000000d86 <link>:
.global link
link:
 li a7, SYS_link
     d86:	48cd                	li	a7,19
 ecall
     d88:	00000073          	ecall
 ret
     d8c:	8082                	ret

0000000000000d8e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     d8e:	48d1                	li	a7,20
 ecall
     d90:	00000073          	ecall
 ret
     d94:	8082                	ret

0000000000000d96 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     d96:	48a5                	li	a7,9
 ecall
     d98:	00000073          	ecall
 ret
     d9c:	8082                	ret

0000000000000d9e <dup>:
.global dup
dup:
 li a7, SYS_dup
     d9e:	48a9                	li	a7,10
 ecall
     da0:	00000073          	ecall
 ret
     da4:	8082                	ret

0000000000000da6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     da6:	48ad                	li	a7,11
 ecall
     da8:	00000073          	ecall
 ret
     dac:	8082                	ret

0000000000000dae <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     dae:	48b1                	li	a7,12
 ecall
     db0:	00000073          	ecall
 ret
     db4:	8082                	ret

0000000000000db6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     db6:	48b5                	li	a7,13
 ecall
     db8:	00000073          	ecall
 ret
     dbc:	8082                	ret

0000000000000dbe <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     dbe:	48b9                	li	a7,14
 ecall
     dc0:	00000073          	ecall
 ret
     dc4:	8082                	ret

0000000000000dc6 <trigger>:
.global trigger
trigger:
 li a7, SYS_trigger
     dc6:	48dd                	li	a7,23
 ecall
     dc8:	00000073          	ecall
 ret
     dcc:	8082                	ret

0000000000000dce <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     dce:	1101                	addi	sp,sp,-32
     dd0:	ec06                	sd	ra,24(sp)
     dd2:	e822                	sd	s0,16(sp)
     dd4:	1000                	addi	s0,sp,32
     dd6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
     dda:	4605                	li	a2,1
     ddc:	fef40593          	addi	a1,s0,-17
     de0:	f67ff0ef          	jal	ra,d46 <write>
}
     de4:	60e2                	ld	ra,24(sp)
     de6:	6442                	ld	s0,16(sp)
     de8:	6105                	addi	sp,sp,32
     dea:	8082                	ret

0000000000000dec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     dec:	7139                	addi	sp,sp,-64
     dee:	fc06                	sd	ra,56(sp)
     df0:	f822                	sd	s0,48(sp)
     df2:	f426                	sd	s1,40(sp)
     df4:	f04a                	sd	s2,32(sp)
     df6:	ec4e                	sd	s3,24(sp)
     df8:	0080                	addi	s0,sp,64
     dfa:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     dfc:	c299                	beqz	a3,e02 <printint+0x16>
     dfe:	0805c663          	bltz	a1,e8a <printint+0x9e>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     e02:	2581                	sext.w	a1,a1
  neg = 0;
     e04:	4881                	li	a7,0
     e06:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
     e0a:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
     e0c:	2601                	sext.w	a2,a2
     e0e:	00000517          	auipc	a0,0x0
     e12:	64a50513          	addi	a0,a0,1610 # 1458 <digits>
     e16:	883a                	mv	a6,a4
     e18:	2705                	addiw	a4,a4,1
     e1a:	02c5f7bb          	remuw	a5,a1,a2
     e1e:	1782                	slli	a5,a5,0x20
     e20:	9381                	srli	a5,a5,0x20
     e22:	97aa                	add	a5,a5,a0
     e24:	0007c783          	lbu	a5,0(a5)
     e28:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
     e2c:	0005879b          	sext.w	a5,a1
     e30:	02c5d5bb          	divuw	a1,a1,a2
     e34:	0685                	addi	a3,a3,1
     e36:	fec7f0e3          	bgeu	a5,a2,e16 <printint+0x2a>
  if(neg)
     e3a:	00088b63          	beqz	a7,e50 <printint+0x64>
    buf[i++] = '-';
     e3e:	fd040793          	addi	a5,s0,-48
     e42:	973e                	add	a4,a4,a5
     e44:	02d00793          	li	a5,45
     e48:	fef70823          	sb	a5,-16(a4)
     e4c:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
     e50:	02e05663          	blez	a4,e7c <printint+0x90>
     e54:	fc040793          	addi	a5,s0,-64
     e58:	00e78933          	add	s2,a5,a4
     e5c:	fff78993          	addi	s3,a5,-1
     e60:	99ba                	add	s3,s3,a4
     e62:	377d                	addiw	a4,a4,-1
     e64:	1702                	slli	a4,a4,0x20
     e66:	9301                	srli	a4,a4,0x20
     e68:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
     e6c:	fff94583          	lbu	a1,-1(s2)
     e70:	8526                	mv	a0,s1
     e72:	f5dff0ef          	jal	ra,dce <putc>
  while(--i >= 0)
     e76:	197d                	addi	s2,s2,-1
     e78:	ff391ae3          	bne	s2,s3,e6c <printint+0x80>
}
     e7c:	70e2                	ld	ra,56(sp)
     e7e:	7442                	ld	s0,48(sp)
     e80:	74a2                	ld	s1,40(sp)
     e82:	7902                	ld	s2,32(sp)
     e84:	69e2                	ld	s3,24(sp)
     e86:	6121                	addi	sp,sp,64
     e88:	8082                	ret
    x = -xx;
     e8a:	40b005bb          	negw	a1,a1
    neg = 1;
     e8e:	4885                	li	a7,1
    x = -xx;
     e90:	bf9d                	j	e06 <printint+0x1a>

0000000000000e92 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     e92:	7119                	addi	sp,sp,-128
     e94:	fc86                	sd	ra,120(sp)
     e96:	f8a2                	sd	s0,112(sp)
     e98:	f4a6                	sd	s1,104(sp)
     e9a:	f0ca                	sd	s2,96(sp)
     e9c:	ecce                	sd	s3,88(sp)
     e9e:	e8d2                	sd	s4,80(sp)
     ea0:	e4d6                	sd	s5,72(sp)
     ea2:	e0da                	sd	s6,64(sp)
     ea4:	fc5e                	sd	s7,56(sp)
     ea6:	f862                	sd	s8,48(sp)
     ea8:	f466                	sd	s9,40(sp)
     eaa:	f06a                	sd	s10,32(sp)
     eac:	ec6e                	sd	s11,24(sp)
     eae:	0100                	addi	s0,sp,128
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
     eb0:	0005c903          	lbu	s2,0(a1)
     eb4:	22090e63          	beqz	s2,10f0 <vprintf+0x25e>
     eb8:	8b2a                	mv	s6,a0
     eba:	8a2e                	mv	s4,a1
     ebc:	8bb2                	mv	s7,a2
  state = 0;
     ebe:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
     ec0:	4481                	li	s1,0
     ec2:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
     ec4:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
     ec8:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
     ecc:	06c00d13          	li	s10,108
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
        printint(fd, va_arg(ap, uint64), 10, 1);
        i += 2;
      } else if(c0 == 'u'){
     ed0:	07500d93          	li	s11,117
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     ed4:	00000c97          	auipc	s9,0x0
     ed8:	584c8c93          	addi	s9,s9,1412 # 1458 <digits>
     edc:	a005                	j	efc <vprintf+0x6a>
        putc(fd, c0);
     ede:	85ca                	mv	a1,s2
     ee0:	855a                	mv	a0,s6
     ee2:	eedff0ef          	jal	ra,dce <putc>
     ee6:	a019                	j	eec <vprintf+0x5a>
    } else if(state == '%'){
     ee8:	03598263          	beq	s3,s5,f0c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
     eec:	2485                	addiw	s1,s1,1
     eee:	8726                	mv	a4,s1
     ef0:	009a07b3          	add	a5,s4,s1
     ef4:	0007c903          	lbu	s2,0(a5)
     ef8:	1e090c63          	beqz	s2,10f0 <vprintf+0x25e>
    c0 = fmt[i] & 0xff;
     efc:	0009079b          	sext.w	a5,s2
    if(state == 0){
     f00:	fe0994e3          	bnez	s3,ee8 <vprintf+0x56>
      if(c0 == '%'){
     f04:	fd579de3          	bne	a5,s5,ede <vprintf+0x4c>
        state = '%';
     f08:	89be                	mv	s3,a5
     f0a:	b7cd                	j	eec <vprintf+0x5a>
      if(c0) c1 = fmt[i+1] & 0xff;
     f0c:	cfa5                	beqz	a5,f84 <vprintf+0xf2>
     f0e:	00ea06b3          	add	a3,s4,a4
     f12:	0016c683          	lbu	a3,1(a3)
      c1 = c2 = 0;
     f16:	8636                	mv	a2,a3
      if(c1) c2 = fmt[i+2] & 0xff;
     f18:	c681                	beqz	a3,f20 <vprintf+0x8e>
     f1a:	9752                	add	a4,a4,s4
     f1c:	00274603          	lbu	a2,2(a4)
      if(c0 == 'd'){
     f20:	03878a63          	beq	a5,s8,f54 <vprintf+0xc2>
      } else if(c0 == 'l' && c1 == 'd'){
     f24:	05a78463          	beq	a5,s10,f6c <vprintf+0xda>
      } else if(c0 == 'u'){
     f28:	0db78763          	beq	a5,s11,ff6 <vprintf+0x164>
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
        printint(fd, va_arg(ap, uint64), 10, 0);
        i += 2;
      } else if(c0 == 'x'){
     f2c:	07800713          	li	a4,120
     f30:	10e78963          	beq	a5,a4,1042 <vprintf+0x1b0>
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 1;
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
        printint(fd, va_arg(ap, uint64), 16, 0);
        i += 2;
      } else if(c0 == 'p'){
     f34:	07000713          	li	a4,112
     f38:	12e78e63          	beq	a5,a4,1074 <vprintf+0x1e2>
        printptr(fd, va_arg(ap, uint64));
      } else if(c0 == 's'){
     f3c:	07300713          	li	a4,115
     f40:	16e78b63          	beq	a5,a4,10b6 <vprintf+0x224>
        if((s = va_arg(ap, char*)) == 0)
          s = "(null)";
        for(; *s; s++)
          putc(fd, *s);
      } else if(c0 == '%'){
     f44:	05579063          	bne	a5,s5,f84 <vprintf+0xf2>
        putc(fd, '%');
     f48:	85d6                	mv	a1,s5
     f4a:	855a                	mv	a0,s6
     f4c:	e83ff0ef          	jal	ra,dce <putc>
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
#endif
      state = 0;
     f50:	4981                	li	s3,0
     f52:	bf69                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 1);
     f54:	008b8913          	addi	s2,s7,8
     f58:	4685                	li	a3,1
     f5a:	4629                	li	a2,10
     f5c:	000ba583          	lw	a1,0(s7)
     f60:	855a                	mv	a0,s6
     f62:	e8bff0ef          	jal	ra,dec <printint>
     f66:	8bca                	mv	s7,s2
      state = 0;
     f68:	4981                	li	s3,0
     f6a:	b749                	j	eec <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'd'){
     f6c:	03868663          	beq	a3,s8,f98 <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
     f70:	05a68163          	beq	a3,s10,fb2 <vprintf+0x120>
      } else if(c0 == 'l' && c1 == 'u'){
     f74:	09b68d63          	beq	a3,s11,100e <vprintf+0x17c>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
     f78:	03a68f63          	beq	a3,s10,fb6 <vprintf+0x124>
      } else if(c0 == 'l' && c1 == 'x'){
     f7c:	07800793          	li	a5,120
     f80:	0cf68d63          	beq	a3,a5,105a <vprintf+0x1c8>
        putc(fd, '%');
     f84:	85d6                	mv	a1,s5
     f86:	855a                	mv	a0,s6
     f88:	e47ff0ef          	jal	ra,dce <putc>
        putc(fd, c0);
     f8c:	85ca                	mv	a1,s2
     f8e:	855a                	mv	a0,s6
     f90:	e3fff0ef          	jal	ra,dce <putc>
      state = 0;
     f94:	4981                	li	s3,0
     f96:	bf99                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
     f98:	008b8913          	addi	s2,s7,8
     f9c:	4685                	li	a3,1
     f9e:	4629                	li	a2,10
     fa0:	000ba583          	lw	a1,0(s7)
     fa4:	855a                	mv	a0,s6
     fa6:	e47ff0ef          	jal	ra,dec <printint>
        i += 1;
     faa:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 1);
     fac:	8bca                	mv	s7,s2
      state = 0;
     fae:	4981                	li	s3,0
        i += 1;
     fb0:	bf35                	j	eec <vprintf+0x5a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
     fb2:	03860563          	beq	a2,s8,fdc <vprintf+0x14a>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
     fb6:	07b60963          	beq	a2,s11,1028 <vprintf+0x196>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
     fba:	07800793          	li	a5,120
     fbe:	fcf613e3          	bne	a2,a5,f84 <vprintf+0xf2>
        printint(fd, va_arg(ap, uint64), 16, 0);
     fc2:	008b8913          	addi	s2,s7,8
     fc6:	4681                	li	a3,0
     fc8:	4641                	li	a2,16
     fca:	000ba583          	lw	a1,0(s7)
     fce:	855a                	mv	a0,s6
     fd0:	e1dff0ef          	jal	ra,dec <printint>
        i += 2;
     fd4:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 16, 0);
     fd6:	8bca                	mv	s7,s2
      state = 0;
     fd8:	4981                	li	s3,0
        i += 2;
     fda:	bf09                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 1);
     fdc:	008b8913          	addi	s2,s7,8
     fe0:	4685                	li	a3,1
     fe2:	4629                	li	a2,10
     fe4:	000ba583          	lw	a1,0(s7)
     fe8:	855a                	mv	a0,s6
     fea:	e03ff0ef          	jal	ra,dec <printint>
        i += 2;
     fee:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 1);
     ff0:	8bca                	mv	s7,s2
      state = 0;
     ff2:	4981                	li	s3,0
        i += 2;
     ff4:	bde5                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 10, 0);
     ff6:	008b8913          	addi	s2,s7,8
     ffa:	4681                	li	a3,0
     ffc:	4629                	li	a2,10
     ffe:	000ba583          	lw	a1,0(s7)
    1002:	855a                	mv	a0,s6
    1004:	de9ff0ef          	jal	ra,dec <printint>
    1008:	8bca                	mv	s7,s2
      state = 0;
    100a:	4981                	li	s3,0
    100c:	b5c5                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
    100e:	008b8913          	addi	s2,s7,8
    1012:	4681                	li	a3,0
    1014:	4629                	li	a2,10
    1016:	000ba583          	lw	a1,0(s7)
    101a:	855a                	mv	a0,s6
    101c:	dd1ff0ef          	jal	ra,dec <printint>
        i += 1;
    1020:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 10, 0);
    1022:	8bca                	mv	s7,s2
      state = 0;
    1024:	4981                	li	s3,0
        i += 1;
    1026:	b5d9                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1028:	008b8913          	addi	s2,s7,8
    102c:	4681                	li	a3,0
    102e:	4629                	li	a2,10
    1030:	000ba583          	lw	a1,0(s7)
    1034:	855a                	mv	a0,s6
    1036:	db7ff0ef          	jal	ra,dec <printint>
        i += 2;
    103a:	2489                	addiw	s1,s1,2
        printint(fd, va_arg(ap, uint64), 10, 0);
    103c:	8bca                	mv	s7,s2
      state = 0;
    103e:	4981                	li	s3,0
        i += 2;
    1040:	b575                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, int), 16, 0);
    1042:	008b8913          	addi	s2,s7,8
    1046:	4681                	li	a3,0
    1048:	4641                	li	a2,16
    104a:	000ba583          	lw	a1,0(s7)
    104e:	855a                	mv	a0,s6
    1050:	d9dff0ef          	jal	ra,dec <printint>
    1054:	8bca                	mv	s7,s2
      state = 0;
    1056:	4981                	li	s3,0
    1058:	bd51                	j	eec <vprintf+0x5a>
        printint(fd, va_arg(ap, uint64), 16, 0);
    105a:	008b8913          	addi	s2,s7,8
    105e:	4681                	li	a3,0
    1060:	4641                	li	a2,16
    1062:	000ba583          	lw	a1,0(s7)
    1066:	855a                	mv	a0,s6
    1068:	d85ff0ef          	jal	ra,dec <printint>
        i += 1;
    106c:	2485                	addiw	s1,s1,1
        printint(fd, va_arg(ap, uint64), 16, 0);
    106e:	8bca                	mv	s7,s2
      state = 0;
    1070:	4981                	li	s3,0
        i += 1;
    1072:	bdad                	j	eec <vprintf+0x5a>
        printptr(fd, va_arg(ap, uint64));
    1074:	008b8793          	addi	a5,s7,8
    1078:	f8f43423          	sd	a5,-120(s0)
    107c:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
    1080:	03000593          	li	a1,48
    1084:	855a                	mv	a0,s6
    1086:	d49ff0ef          	jal	ra,dce <putc>
  putc(fd, 'x');
    108a:	07800593          	li	a1,120
    108e:	855a                	mv	a0,s6
    1090:	d3fff0ef          	jal	ra,dce <putc>
    1094:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1096:	03c9d793          	srli	a5,s3,0x3c
    109a:	97e6                	add	a5,a5,s9
    109c:	0007c583          	lbu	a1,0(a5)
    10a0:	855a                	mv	a0,s6
    10a2:	d2dff0ef          	jal	ra,dce <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    10a6:	0992                	slli	s3,s3,0x4
    10a8:	397d                	addiw	s2,s2,-1
    10aa:	fe0916e3          	bnez	s2,1096 <vprintf+0x204>
        printptr(fd, va_arg(ap, uint64));
    10ae:	f8843b83          	ld	s7,-120(s0)
      state = 0;
    10b2:	4981                	li	s3,0
    10b4:	bd25                	j	eec <vprintf+0x5a>
        if((s = va_arg(ap, char*)) == 0)
    10b6:	008b8993          	addi	s3,s7,8
    10ba:	000bb903          	ld	s2,0(s7)
    10be:	00090f63          	beqz	s2,10dc <vprintf+0x24a>
        for(; *s; s++)
    10c2:	00094583          	lbu	a1,0(s2)
    10c6:	c195                	beqz	a1,10ea <vprintf+0x258>
          putc(fd, *s);
    10c8:	855a                	mv	a0,s6
    10ca:	d05ff0ef          	jal	ra,dce <putc>
        for(; *s; s++)
    10ce:	0905                	addi	s2,s2,1
    10d0:	00094583          	lbu	a1,0(s2)
    10d4:	f9f5                	bnez	a1,10c8 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
    10d6:	8bce                	mv	s7,s3
      state = 0;
    10d8:	4981                	li	s3,0
    10da:	bd09                	j	eec <vprintf+0x5a>
          s = "(null)";
    10dc:	00000917          	auipc	s2,0x0
    10e0:	37490913          	addi	s2,s2,884 # 1450 <malloc+0x25e>
        for(; *s; s++)
    10e4:	02800593          	li	a1,40
    10e8:	b7c5                	j	10c8 <vprintf+0x236>
        if((s = va_arg(ap, char*)) == 0)
    10ea:	8bce                	mv	s7,s3
      state = 0;
    10ec:	4981                	li	s3,0
    10ee:	bbfd                	j	eec <vprintf+0x5a>
    }
  }
}
    10f0:	70e6                	ld	ra,120(sp)
    10f2:	7446                	ld	s0,112(sp)
    10f4:	74a6                	ld	s1,104(sp)
    10f6:	7906                	ld	s2,96(sp)
    10f8:	69e6                	ld	s3,88(sp)
    10fa:	6a46                	ld	s4,80(sp)
    10fc:	6aa6                	ld	s5,72(sp)
    10fe:	6b06                	ld	s6,64(sp)
    1100:	7be2                	ld	s7,56(sp)
    1102:	7c42                	ld	s8,48(sp)
    1104:	7ca2                	ld	s9,40(sp)
    1106:	7d02                	ld	s10,32(sp)
    1108:	6de2                	ld	s11,24(sp)
    110a:	6109                	addi	sp,sp,128
    110c:	8082                	ret

000000000000110e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    110e:	715d                	addi	sp,sp,-80
    1110:	ec06                	sd	ra,24(sp)
    1112:	e822                	sd	s0,16(sp)
    1114:	1000                	addi	s0,sp,32
    1116:	e010                	sd	a2,0(s0)
    1118:	e414                	sd	a3,8(s0)
    111a:	e818                	sd	a4,16(s0)
    111c:	ec1c                	sd	a5,24(s0)
    111e:	03043023          	sd	a6,32(s0)
    1122:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    1126:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    112a:	8622                	mv	a2,s0
    112c:	d67ff0ef          	jal	ra,e92 <vprintf>
}
    1130:	60e2                	ld	ra,24(sp)
    1132:	6442                	ld	s0,16(sp)
    1134:	6161                	addi	sp,sp,80
    1136:	8082                	ret

0000000000001138 <printf>:

void
printf(const char *fmt, ...)
{
    1138:	711d                	addi	sp,sp,-96
    113a:	ec06                	sd	ra,24(sp)
    113c:	e822                	sd	s0,16(sp)
    113e:	1000                	addi	s0,sp,32
    1140:	e40c                	sd	a1,8(s0)
    1142:	e810                	sd	a2,16(s0)
    1144:	ec14                	sd	a3,24(s0)
    1146:	f018                	sd	a4,32(s0)
    1148:	f41c                	sd	a5,40(s0)
    114a:	03043823          	sd	a6,48(s0)
    114e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1152:	00840613          	addi	a2,s0,8
    1156:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    115a:	85aa                	mv	a1,a0
    115c:	4505                	li	a0,1
    115e:	d35ff0ef          	jal	ra,e92 <vprintf>
}
    1162:	60e2                	ld	ra,24(sp)
    1164:	6442                	ld	s0,16(sp)
    1166:	6125                	addi	sp,sp,96
    1168:	8082                	ret

000000000000116a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    116a:	1141                	addi	sp,sp,-16
    116c:	e422                	sd	s0,8(sp)
    116e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1170:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1174:	00001797          	auipc	a5,0x1
    1178:	e9c7b783          	ld	a5,-356(a5) # 2010 <freep>
    117c:	a805                	j	11ac <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    117e:	4618                	lw	a4,8(a2)
    1180:	9db9                	addw	a1,a1,a4
    1182:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    1186:	6398                	ld	a4,0(a5)
    1188:	6318                	ld	a4,0(a4)
    118a:	fee53823          	sd	a4,-16(a0)
    118e:	a091                	j	11d2 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1190:	ff852703          	lw	a4,-8(a0)
    1194:	9e39                	addw	a2,a2,a4
    1196:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    1198:	ff053703          	ld	a4,-16(a0)
    119c:	e398                	sd	a4,0(a5)
    119e:	a099                	j	11e4 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11a0:	6398                	ld	a4,0(a5)
    11a2:	00e7e463          	bltu	a5,a4,11aa <free+0x40>
    11a6:	00e6ea63          	bltu	a3,a4,11ba <free+0x50>
{
    11aa:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11ac:	fed7fae3          	bgeu	a5,a3,11a0 <free+0x36>
    11b0:	6398                	ld	a4,0(a5)
    11b2:	00e6e463          	bltu	a3,a4,11ba <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11b6:	fee7eae3          	bltu	a5,a4,11aa <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
    11ba:	ff852583          	lw	a1,-8(a0)
    11be:	6390                	ld	a2,0(a5)
    11c0:	02059713          	slli	a4,a1,0x20
    11c4:	9301                	srli	a4,a4,0x20
    11c6:	0712                	slli	a4,a4,0x4
    11c8:	9736                	add	a4,a4,a3
    11ca:	fae60ae3          	beq	a2,a4,117e <free+0x14>
    bp->s.ptr = p->s.ptr;
    11ce:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    11d2:	4790                	lw	a2,8(a5)
    11d4:	02061713          	slli	a4,a2,0x20
    11d8:	9301                	srli	a4,a4,0x20
    11da:	0712                	slli	a4,a4,0x4
    11dc:	973e                	add	a4,a4,a5
    11de:	fae689e3          	beq	a3,a4,1190 <free+0x26>
  } else
    p->s.ptr = bp;
    11e2:	e394                	sd	a3,0(a5)
  freep = p;
    11e4:	00001717          	auipc	a4,0x1
    11e8:	e2f73623          	sd	a5,-468(a4) # 2010 <freep>
}
    11ec:	6422                	ld	s0,8(sp)
    11ee:	0141                	addi	sp,sp,16
    11f0:	8082                	ret

00000000000011f2 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    11f2:	7139                	addi	sp,sp,-64
    11f4:	fc06                	sd	ra,56(sp)
    11f6:	f822                	sd	s0,48(sp)
    11f8:	f426                	sd	s1,40(sp)
    11fa:	f04a                	sd	s2,32(sp)
    11fc:	ec4e                	sd	s3,24(sp)
    11fe:	e852                	sd	s4,16(sp)
    1200:	e456                	sd	s5,8(sp)
    1202:	e05a                	sd	s6,0(sp)
    1204:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1206:	02051493          	slli	s1,a0,0x20
    120a:	9081                	srli	s1,s1,0x20
    120c:	04bd                	addi	s1,s1,15
    120e:	8091                	srli	s1,s1,0x4
    1210:	0014899b          	addiw	s3,s1,1
    1214:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    1216:	00001517          	auipc	a0,0x1
    121a:	dfa53503          	ld	a0,-518(a0) # 2010 <freep>
    121e:	c515                	beqz	a0,124a <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1220:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1222:	4798                	lw	a4,8(a5)
    1224:	02977f63          	bgeu	a4,s1,1262 <malloc+0x70>
    1228:	8a4e                	mv	s4,s3
    122a:	0009871b          	sext.w	a4,s3
    122e:	6685                	lui	a3,0x1
    1230:	00d77363          	bgeu	a4,a3,1236 <malloc+0x44>
    1234:	6a05                	lui	s4,0x1
    1236:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    123a:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    123e:	00001917          	auipc	s2,0x1
    1242:	dd290913          	addi	s2,s2,-558 # 2010 <freep>
  if(p == (char*)-1)
    1246:	5afd                	li	s5,-1
    1248:	a0bd                	j	12b6 <malloc+0xc4>
    base.s.ptr = freep = prevp = &base;
    124a:	00001797          	auipc	a5,0x1
    124e:	e3e78793          	addi	a5,a5,-450 # 2088 <base>
    1252:	00001717          	auipc	a4,0x1
    1256:	daf73f23          	sd	a5,-578(a4) # 2010 <freep>
    125a:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    125c:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    1260:	b7e1                	j	1228 <malloc+0x36>
      if(p->s.size == nunits)
    1262:	02e48b63          	beq	s1,a4,1298 <malloc+0xa6>
        p->s.size -= nunits;
    1266:	4137073b          	subw	a4,a4,s3
    126a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    126c:	1702                	slli	a4,a4,0x20
    126e:	9301                	srli	a4,a4,0x20
    1270:	0712                	slli	a4,a4,0x4
    1272:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    1274:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    1278:	00001717          	auipc	a4,0x1
    127c:	d8a73c23          	sd	a0,-616(a4) # 2010 <freep>
      return (void*)(p + 1);
    1280:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1284:	70e2                	ld	ra,56(sp)
    1286:	7442                	ld	s0,48(sp)
    1288:	74a2                	ld	s1,40(sp)
    128a:	7902                	ld	s2,32(sp)
    128c:	69e2                	ld	s3,24(sp)
    128e:	6a42                	ld	s4,16(sp)
    1290:	6aa2                	ld	s5,8(sp)
    1292:	6b02                	ld	s6,0(sp)
    1294:	6121                	addi	sp,sp,64
    1296:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    1298:	6398                	ld	a4,0(a5)
    129a:	e118                	sd	a4,0(a0)
    129c:	bff1                	j	1278 <malloc+0x86>
  hp->s.size = nu;
    129e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    12a2:	0541                	addi	a0,a0,16
    12a4:	ec7ff0ef          	jal	ra,116a <free>
  return freep;
    12a8:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    12ac:	dd61                	beqz	a0,1284 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12ae:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    12b0:	4798                	lw	a4,8(a5)
    12b2:	fa9778e3          	bgeu	a4,s1,1262 <malloc+0x70>
    if(p == freep)
    12b6:	00093703          	ld	a4,0(s2)
    12ba:	853e                	mv	a0,a5
    12bc:	fef719e3          	bne	a4,a5,12ae <malloc+0xbc>
  p = sbrk(nu * sizeof(Header));
    12c0:	8552                	mv	a0,s4
    12c2:	aedff0ef          	jal	ra,dae <sbrk>
  if(p == (char*)-1)
    12c6:	fd551ce3          	bne	a0,s5,129e <malloc+0xac>
        return 0;
    12ca:	4501                	li	a0,0
    12cc:	bf65                	j	1284 <malloc+0x92>
