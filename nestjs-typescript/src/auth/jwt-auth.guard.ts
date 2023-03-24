import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";
import { Observable } from "rxjs";

@Injectable()
export class JwtAuthGuard implements CanActivate {

    constructor(private jwtService: JwtService) {}

    canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
        const req = context.switchToHttp().getRequest();
        try {
            // Получаем header
            const authHeader = req.headers.authorization;

            // header состоит из 2-х частей: типа токена и самого токена
            // Тип токена
            const bearer = authHeader.split(' ')[0];
            // Сам токен
            const token = authHeader.split(' ')[1];

            if (bearer !== 'Bearer' || !token) {
                throw new UnauthorizedException({message: 'Пользователь не авторизован'});               
            }

            // Раскодируем токен
            const user = this.jwtService.verify(token);
            // Записываем раскодированного user
            req.user = user;
            return true;
        } catch (e) {
            throw new UnauthorizedException({message: 'Пользователь не авторизован'});
        }
    }

}